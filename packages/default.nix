# Includes all packages in the directory (besides palette.nix)
{ lib
, pkgs
, ... 
}:

let
  package_dirs = lib.pipe ./. [
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