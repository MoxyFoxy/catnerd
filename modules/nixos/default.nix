{ lib
, pkgs
}@args:

{
  imports = ../../lib/mkImport.nix ./. args;
}