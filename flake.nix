{
  description = "Vanillin Starskater's linux rice :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      modules = [./system/main.nix];
    };

    homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [./home/main.nix];
    };
  };
}
