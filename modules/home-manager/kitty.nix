{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catppuccin.flavour;
in
{
  config.programs.kitty = lib.mkIf config.catppuccin.enable {
    theme = "Catppuccin-${lib.mkUpper flavour}";

    font = {
      package = pkgs.nerdfonts;
      name = "${config.catppuccin.nerdfonts.mono.font} Nerd Font";
      size = config.catppuccin.nerdfonts.mono.size;
    };
  };
}