{ lib
, ...
}@args:

let
  packageNames = builtins.filter
    (name: !(builtins.elem name [ "default.nix" ]))
    (builtins.attrNames (builtins.readDir ./.));

  packageImports = builtins.listToAttrs (map
    (name: { inherit name; value = import ././${name}/default.nix args; })
    packageNames);
in
  packageImports