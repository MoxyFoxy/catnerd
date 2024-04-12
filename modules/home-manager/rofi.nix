{ config
, lib
, pkgs
, ...
}:

let
  enable = config.catppuccin.enable && config.programs.rofi.enable;

  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;
in
{
  options.programs.rofi.catppuccin = lib.ctp.mkCatppuccinOpt "rofi";

  config.programs.rofi = lib.mkIf enable {
    theme = "${pkgs.ctp.catppuccin-rofi.override { inherit flavour accent; }}";
  };
}