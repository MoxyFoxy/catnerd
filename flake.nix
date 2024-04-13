{
  description = "Soothing pastel theme for Nix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    homeManagerModules.catppuccin = import ./modules/home-manager;
    nixosModules.catppuccin = import ./modules/nixos;

    packages.${system} = import ./packages { inherit (pkgs) callPackage; };

    # checks.${system}.default = pkgs.callPackage ./tests { 
    #   inherit self;
    # };
  };
}