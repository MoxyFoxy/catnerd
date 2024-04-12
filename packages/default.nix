{ lib
, ...
}@args:

{
  imports = lib.pipe ./. [
    builtins.readDir
    builtins.attrNames

    (builtins.filter (
      name: !(builtins.elem name [ "default.nix" ])
    ))

    (map (
      package: _: import "./${package}" (args)
    ))
  ];
}