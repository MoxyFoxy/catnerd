{
  description = "Soothing pastel theme for Nix";

  outputs = { self }:
  {
    homeManagerModules.catppuccin = import ./modules/home-manager;
    nixosModules.catppuccin = import ./modules/nixos;
  };
}