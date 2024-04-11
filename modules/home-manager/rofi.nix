{ config
, lib
, variant
, accent
, ...
}:

let
  cfg = config.programs.rofi;
in
{
  config.programs.rofi = lib.mkIf cfg.enable {
    theme = "${../../packages/catppuccin-rofi.override { inherit variant accent; }}";
  };
}