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
  config.wayland.windowManager.hyprland.settings.source = lib.mkIf config.catppuccin.enable
    [
      "${pkgs.catppuccin-hyprland.override { inherit flavour accent; }}"
    ];
}