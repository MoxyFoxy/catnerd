{ config
, lib
, pkgs
, palette
, ...
}:

let
  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;
in
{
  config.wayland.windowManager.hyprland.settings = lib.mkIf config.catppuccin.enable
  {
    source = [
      "${pkgs.catppuccin-hyprland.override { inherit flavour accent; }}"
    ];
    misc.background_color = "rgb(${lib.mkColour palette.${flavour}.base})";
  };
}