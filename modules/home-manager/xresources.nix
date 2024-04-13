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
  config.xresources = lib.mkIf config.catppuccin.enable {
    extraConfig = "${pkgs.catppuccin-xresources.override { inherit flavour accent; }}";
  };
}