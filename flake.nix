{
  description = "Soothing pastel theme for Nix";

  outputs = _:
  let
    pkgs = {
      catppuccin-rofi = (builtins.callPackage ./packages/catppuccin/rofi {});
    };
  in
  {
    homeManagerModules.catppuccin = import ./modules/home-manager;
    nixosModules.catppuccin = import ./modules/nixos;
  };
}