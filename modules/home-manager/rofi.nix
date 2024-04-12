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
  config.programs.rofi = lib.mkIf enable {
    theme = "${pkgs.ctp.catppuccin-rofi.override { inherit flavour accent; }}";
  };
}