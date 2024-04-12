{ lib
, ...
}: 

{
  options.catppuccin = {
    enable = lib.mkEnableOption "Global Catppuccin theming";

    flavour = lib.mkOption {
      type = lib.types.enum [
        "latte"
        "frappe"
        "macchiato"
        "mocha"
      ];
      default = "macchiato";
      description = "Global Catppuccin flavour";
    };

    accent = lib.mkOption {
      type = lib.types.enum [
        "rosewater"
        "flamingo"
        "pink"
        "mauve"
        "red"
        "maroon"
        "peach"
        "yellow"
        "green"
        "teal"
        "sky"
        "sapphire"
        "blue"
        "lavender"
      ];
      default = "blue";
      description = "Global Catppuccin accent";
    };
  };
}