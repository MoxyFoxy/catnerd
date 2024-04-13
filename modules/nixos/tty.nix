{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catppuccin.flavour;
  accent = config.catppuccin.accent;

  splitAndFilter = str: lib.filter (s: s != "") (lib.splitString "\n" str);
in
{
  config.boot.kernelParams = lib.mkIf config.catppuccin.enable
   (splitAndFilter (builtins.readFile "${pkgs.catppuccin-tty.override { inherit flavour accent; }}"));
}