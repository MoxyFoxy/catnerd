{ lib
, ... 
}:

{
  types = lib.types // {
    flavourOption = lib.types.enum [ 
      "latte"
      "frappe"
      "macchiato"
      "mocha"
    ];
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

    mainFontOption = lib.types.enum [
      "Ubuntu"
    ];
    monoFontOption = lib.types.enum [
      "UbuntuMono"
      "DroidSansM"
    ];
  };

  # string -> string
  # this removes the first letter in a string,
  # which is sometimes needed in order to format
  # the colours correctly
  mkColour = str:
    with builtins;
    substring 1 (stringLength str) str;

  # string -> string
  # this capitalizes the first letter in a string,
  # which is sometimes needed in order to format
  # the names of themes correctly
  mkUpper = str:
    with builtins;
    (lib.toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);
}