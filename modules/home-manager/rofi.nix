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
  config.programs.rofi = lib.mkIf config.catppuccin.enable {
    theme = "${pkgs.catppuccin-rofi.override { inherit flavour accent; }}";

    font = "${config.catppuccin.nerdfonts.main.font} Nerd Font ${builtins.toString config.catppuccin.nerdfonts.main.size}";
  };
}