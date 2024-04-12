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
  config.programs.rofi = lib.mkIf config.catppuccin.enable {
    theme = "${pkgs.ctp.catppuccin-rofi.override { inherit flavour accent; }}";
  };
}