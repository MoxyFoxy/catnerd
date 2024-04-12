{ config
, lib
, pkgs
, ... 
}:

let
  # string -> type -> string -> a -> a
  # this is an internal function and shouldn't be
  # used unless you know what you're doing. it takes
  # a string (the name of the property, i.e., flavour
  # or accent), the type of the property, the name of
  # the module, followed by local config attrset
  mkBasicOpt = attr: type: name:
    lib.mkOption {
      inherit type;
      default = config.catppuccin.${attr};
      description = "Catppuccin ${attr} for ${name}";
    };

  # string -> a -> a
  # this creates a flavour option for modules
  # the first string should be the name of the module,
  # followed by the local config attrset
  mkFlavourOpt = mkBasicOpt "flavour" types.flavourOption;

  # string -> a -> a
  # this creates an accent option for modules
  # the first string should be the name of the module,
  # followed by the local config attrset
  mkAccentOpt = mkBasicOpt "accent" types.accentOption;

  types = {
    flavourOption = lib.types.enum [ "latte" "frappe" "macchiato" "mocha" ];
    accentOption = lib.types.enum [
      "blue"
      "flamingo"
      "green"
      "lavender"
      "maroon"
      "mauve"
      "peach"
      "pink"
      "red"
      "rosewater"
      "sapphire"
      "sky"
      "teal"
      "yellow"
    ];
  };
in
{
  inherit mkBasicOpt mkFlavourOpt mkAccentOpt types;

  # string -> string
  # this capitalizes the first letter in a string,
  # which is sometimes needed in order to format
  # the names of themes correctly
  mkUpper = str:
    with builtins;
    (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);

  # a -> path -> a
  # fromJSON but for yaml (and without readFile)
  # a should be the local pkgs attrset
  fromYaml = file:
    let
      inherit (builtins) fromJSON readFile;

      # convert to json
      json = with pkgs;
        runCommand "converted.json" { } ''
          ${yj}/bin/yj < ${file} > $out
        '';
    in
    fromJSON (readFile json);

  # a -> path -> a
  # fromJSON but for ini (and without readFile)
  # a should be the local pkgs attrset
  fromINI = file:
    let
      inherit (builtins) fromJSON readFile;

      # convert to json
      json = with pkgs;
        runCommand "converted.json" { } ''
          ${jc}/bin/jc --ini < ${file} > $out
        '';
    in
    fromJSON (readFile json);

  # string -> a -> a
  # this creates a basic attrset only containing an
  # enable, flavour and accent option. the fist string should
  # be the name of the module, followed by the local config
  # attrset
  mkCatppuccinOpt = name: {
    enable = lib.mkEnableOption "Catppuccin theme";
    flavour = mkFlavourOpt name;
    accent = mkAccentOpt name;
  };

  assertXdgEnabled = name: {
    assertion = config.xdg.enable;
    message = "Option xdg.enable must be enabled to apply Catppuccin theming for ${name}";
  };
}