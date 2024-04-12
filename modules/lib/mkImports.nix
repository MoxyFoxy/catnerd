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
    n: !(builtins.elem n [ "default.nix" ])
  ))

  (map (
    f: _: import "${dir}/${f}" (args // {
      lib = lib.extend (_: _: { ctp = import ./. args; });
      pkgs = pkgs.extend (_: _: { ctp = import ../packages args; });
    })
  ))
]