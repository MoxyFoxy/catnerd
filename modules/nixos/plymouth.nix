{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;
in
{
  config.boot.plymouth = lib.mkIf config.catppuccin.enable {
    themePackages = [
      (pkgs.catppuccin-plymouth.override { inherit flavour accent; })
    ];
    theme = "catppuccin-${flavour}";
  };
}