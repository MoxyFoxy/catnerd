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
    source = "${pkgs.catppuccin-hyprlock.override { inherit flavour accent; font = config.catppuccin.nerdfonts.main.font; }}";
  };

  config.xdg.configFile."background" = lib.mkIf config.catppuccin.enable {
    source = pkgs.catppuccin-splash.override { inherit flavour accent; };
  };
}