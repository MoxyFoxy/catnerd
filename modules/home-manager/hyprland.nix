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
  config.wayland.windowManager.hyprland.settings = lib.mkIf config.catppuccin.enable {
    source = [
      "${pkgs.ctp.catppuccin-hyprland.override { inherit flavour accent; }}"
    ] ++ config.wayland.windowManager.hyprland.settings.source;
  };
}