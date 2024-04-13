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
  config.boot.loader.grub = lib.mkIf config.catppuccin.enable {
    theme = "${pkgs.catppuccin-grub.override { inherit flavour accent; }}";
  };
}