{ config
, lib
, ...
}:

let
  flavour = config.catppuccin.flavour;
in
{
  config.programs.kitty = lib.mkIf config.catppuccin.enable {
    theme = "Catppuccin-${lib.mkUpper flavour}";
  };
}