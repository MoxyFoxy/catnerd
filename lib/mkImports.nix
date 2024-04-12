# this imports all files in a directory (besides default.nix)
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
      lib = lib.extend (_: _: { ctp = import ./. args; });
      pkgs = pkgs.extend (_: _: { ctp = import ../packages args; });
    })
  ))
]