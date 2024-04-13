# Imports all files in a directory (besides default.nix)
# Include custom libs and pkgs
{ lib
, pkgs
, ... 
}:

dir:
let
  package_dirs = lib.pipe dir [
    builtins.readDir
    builtins.attrNames

    (builtins.filter (
      name: !(builtins.elem name [ "default.nix" "palette.nix" ])
    ))
  ];
  packages = lib.attrsets.genAttrs package_dirs (
    package_dir: pkgs.callPackage ./${package_dir} { inherit packages; }
  );
in
  packages
