{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;

  palette = import ../../packages/palette.nix;
in
{
  config.wayland.windowManager.hyprland.settings = lib.mkIf config.catppuccin.enable
  {
    source = [
      "${pkgs.catppuccin-hyprland.override { inherit flavour accent; }}"
    ];
    # misc.background = "rgb(${builtins.substring 1 (builtins.stringLength palette.${flavour}.base) palette.${flavour}.base})";
  };
}