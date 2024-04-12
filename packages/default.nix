# Imports all packages in the directory
{ pkgs
, ...
}:

let
  packageNames = builtins.filter
    (name: !(builtins.elem name [ "default.nix" "palette.nix" ]))
    (builtins.attrNames (builtins.readDir ./.));

  packageBuilder = self: builtins.listToAttrs (map
    (name: { inherit name; value = pkgs.callPackage ././${name} { pkgs = self; }; })
    packageNames);

  self = pkgs.lib.fix packageBuilder;
in
  self