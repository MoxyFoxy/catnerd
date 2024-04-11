{
  description = "Soothing pastel theme for Nix";

  outputs = _:
  let
    pkgs = {
      catppuccin-rofi = (builtins.callPackage ./packages/catppuccin/rofi {});
    };
  in
  {
    homeManagerModules.catppuccin = import ./modules/home-manager { inherit pkgs;};
    nixosModules.catppuccin = import ./modules/nixos { inherit pkgs; };
  };
}