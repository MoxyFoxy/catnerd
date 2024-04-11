{ config
, lib
, pkgs
, flavour
, accent
, ...
}:

let
  cfg = config.programs.rofi;
in
{
  config.programs.rofi = lib.mkIf cfg.enable {
    theme = "${pkgs.catppuccin-rofi.override { inherit flavour accent; }}";
  };
}