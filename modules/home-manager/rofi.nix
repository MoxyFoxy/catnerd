{ config
, lib
, pkgs
, ...
}:

let
  inherit (lib) ctp;
  enable = config.programs.rofi.enable;

  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;
in
{
  options.programs.rofi.catppuccin = lib.ctp.mkCatppuccinOpt "rofi";

  config.programs.rofi = lib.mkIf enable {
    theme = "${pkgs.ctp.catppuccin-rofi.override { inherit flavour accent; }}";
  };
}