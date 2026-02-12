{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, nixpkgs-unstable, home-manager }:
  let
    mkDarwinSystem = { hostname, username, system, gitEmail }: darwin.lib.darwinSystem {
      modules = [
        ({pkgs, ...}: {
          environment.systemPackages = with pkgs; [
            coreutils
          ];

          services.nix-daemon.enable = true;

          nix.settings.experimental-features = "nix-command flakes";

          system.configurationRevision = self.rev or self.dirtyRev or null;

          system.stateVersion = 4;

          nixpkgs.hostPlatform = "aarch64-darwin";
          nixpkgs.config.allowUnfree = true;
          nixpkgs.config.allowUnsupportedSystem = true;

          users.users.${username} = {
            home = "/Users/${username}";
            shell = pkgs.bashInteractive;
          };
        })
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home-manager.nix {
            username = username;
            gitEmail = gitEmail;
          };
          home-manager.extraSpecialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            }; 
          };
        }
      ];
    };
  in
  {
    darwinConfigurations = {
      "Vaibhavs-MacBook-Pro" = mkDarwinSystem {
        hostname = "Vaibhavs-MacBook-Pro";
        username = "vverma";
        system = "aarch64-darwin";
        gitEmail = "627846+v@users.noreply.github.com";
      };
      "nectar" = mkDarwinSystem {
        hostname = "nectar";
        username = "vaibhav";
        system = "aarch64-darwin";
        gitEmail = "vaibhav@nectarsocial.com";
      };
      "vvscale" = mkDarwinSystem {
        hostname = "vvscale";
        username = "vaibhav.verma";
        system = "aarch64-darwin";
        gitEmail = "627846+v@users.noreply.github.com";
      };
      "SCMM0VDYF00M0" = mkDarwinSystem {
        hostname = "SCMM0VDYF00M0";
        username = "vaibhav.verma";
        system = "aarch64-darwin";
        gitEmail = "627846+v@users.noreply.github.com";
      };
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = builtins.mapAttrs (hostname: config: config.pkgs) self.darwinConfigurations;
  };
}
