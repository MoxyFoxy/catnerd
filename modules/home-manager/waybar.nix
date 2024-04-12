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
  config.programs.waybar = lib.mkIf config.catppuccin.enable {
    style = ''
      @import "${pkgs.ctp.catppuccin-waybar.override { inherit flavour accent; }}";
    '' + config.programs.waybar.style;
  };
}