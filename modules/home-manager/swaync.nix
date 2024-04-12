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
  config.xdg.configFile."swaync/style.css" = lib.mkIf config.catppuccin.enable {
    source = "${pkgs.ctp.catppuccin-swaync.override { inherit flavour accent; }}";
  };
}