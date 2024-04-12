{ lib
, pkgs
, ...
}@args:

let
  packageNames = builtins.filter
    (name: !(builtins.elem name [ "default.nix" ]))
    (builtins.attrNames (builtins.readDir ./.));

  packageImports = builtins.listToAttrs (map
    (name: { inherit name; value = pkgs.callPackage ././${name} { }; })
    packageNames);
in
  packageImports