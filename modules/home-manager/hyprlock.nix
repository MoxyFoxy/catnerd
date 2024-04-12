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
  config.xdg.configFile."hypr/hyprlock.conf" = lib.mkIf config.catppuccin.enable {
    source = "${pkgs.ctp.catppuccin-hyprlock.override { inherit flavour accent; }}";
  };
}