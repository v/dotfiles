{
  description = "My Ubuntu Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    # system = "aarch64-linux"; If you are running on ARM powered computer
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      vaibhav = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager.nix
        ];
      };
    };
  };
}


