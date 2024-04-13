# Imports all files in a directory (besides default.nix)
# Include custom libs and pkgs
{ lib
, pkgs
, ... 
}@args:

dir:
lib.pipe dir [
  builtins.readDir
  builtins.attrNames

  (builtins.filter (
    name: !(builtins.elem name [ "default.nix" ])
  ))

  (map (
    file: _: import "${dir}/${file}" (args // {
      lib = lib.extend (_: _: (import ./. args));
      pkgs = pkgs.extend (_: _: (import ../packages args));
      palette = import ../packages/palette.nix;
    })
  ))
]