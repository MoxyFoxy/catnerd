{ config
, lib
, pkgs
, palette
, ...
}:

let
  flavour = config.catnerd.flavour;
  accent = config.catnerd.accent;
in
{
  config.wayland.windowManager.hyprland.settings = lib.mkIf config.catnerd.enable
  {
    source = [
      "${pkgs.catppuccin-hyprland.override { inherit flavour accent; }}"
    ];
    misc.background_color = "rgb(${lib.mkColour palette.${flavour}.base})";
  };
}