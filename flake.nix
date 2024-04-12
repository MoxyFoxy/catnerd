{
  description = "Soothing pastel theme for Nix";

  # Inputs for testing
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... }@inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs { inherit system; };
  in {
    homeManagerModules.catppuccin = import ./modules/home-manager;
    nixosModules.catppuccin = import ./modules/nixos;

    packages.${system} = import ./packages { inherit pkgs; };

    checks.${system}.default = pkgs.callPackage ./tests { inherit inputs; };
  };
}