{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, nixpkgs-unstable, home-manager }:
  let
    mkDarwinSystem = { hostname, username }: darwin.lib.darwinSystem {
      modules = [
        ({pkgs, ...}: {
          environment.systemPackages = with pkgs; [
            coreutils
          ];

          services.nix-daemon.enable = true;

          nix.settings.experimental-features = "nix-command flakes";

          system.configurationRevision = self.rev or self.dirtyRev or null;

          system.stateVersion = 4;

          nixpkgs.hostPlatform = "x86_64-darwin";
          nixpkgs.config.allowUnfree = true;
          nixpkgs.config.allowUnsupportedSystem = true;

          users.users.${username} = {
            home = "/Users/${username}";
            shell = pkgs.bash;
          };
        })
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home-manager.nix { 
            username = username;
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
      };
      "vvscale" = mkDarwinSystem {
        hostname = "vvscale";
        username = "vaibhav.verma";
      };
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = builtins.mapAttrs (hostname: config: config.pkgs) self.darwinConfigurations;
  };
}
