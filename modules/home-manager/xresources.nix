{ config
, lib
, pkgs
, ...
}:

let
  enable = config.catppuccin.enable;

  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;
in
{
  config.xresources = lib.mkIf enable {
    extraConfig = "${pkgs.ctp.catppuccin-xresources.override { inherit lib flavour accent; }}";
  };
}