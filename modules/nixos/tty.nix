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
  config.boot.kernelParams = lib.mkIf config.catppuccin.enable
    config.boot.kernelParams ++ lib.splitString "\n" (builtins.readFile pkgs.catppuccin-tty);
}