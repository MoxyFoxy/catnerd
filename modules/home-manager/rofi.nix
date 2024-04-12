{ config
, lib
, pkgs
, ...
}:

let
  inherit (lib) ctp;
  cfg = config.programs.rofi.catppuccin;
  enable = cfg.enable && config.programs.rofi.enable;

  flavour = cfg.flavour;
  accent = cfg.accent;
in
{
  options.programs.rofi.catppuccin = lib.ctp.mkCatppuccinOpt "rofi";

  config.programs.rofi = lib.mkIf enable {
    theme = "${pkgs.catppuccin-rofi.override { inherit flavour accent; }}";
  };
}