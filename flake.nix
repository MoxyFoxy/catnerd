{
  description = "Soothing pastel theme for Nix";

  inputs = {
    nixpkgs = { 
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";

    pkgs = nixpkgs.legacyPackages.${system}.extend (self: super: {
      catppuccin-rofi = self.callPackage ./packages/catppuccin/rofi {};
    });
  in
  {
    homeManagerModules.catppuccin = import ./modules/home-manager {inherit pkgs; };
    nixosModules.catppuccin = import ./modules/nixos {inherit pkgs; };
  };
}