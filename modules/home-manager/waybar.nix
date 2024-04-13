{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;

  user_style = config.programs.waybar.style;
in
{
  config.programs.waybar = lib.mkIf config.catppuccin.enable {
    style = ''
      @import "${pkgs.catppuccin-waybar.override { inherit flavour accent; }}";
    '';
  };
}