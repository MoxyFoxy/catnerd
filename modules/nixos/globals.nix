{ lib
, ...
}: 

{
  options.catppuccin = {
    enable = lib.mkEnableOption "Global Catppuccin theming";
    
    flavour = lib.mkOption {
      type = lib.types.flavourOption;
      default = "macchiato";
      description = "Global Catppuccin flavour";
    };

    accent = lib.mkOption {
      type = lib.types.accentOption;
      default = "blue";
      description = "Global Catppuccin accent";
    };
  };
}