{ config
, lib
, pkgs
, variant
, accent
, ...
}:

let
  cfg = config.programs.rofi;
in
{
  config.programs.rofi = lib.mkIf cfg.enable {
    theme = "${pkgs.catppuccin-rofi.override { inherit variant accent; }}";
  };
}