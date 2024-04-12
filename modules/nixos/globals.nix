{ lib
, ...
}: 

{
  options.catppuccin = {
    enable = lib.mkEnableOption "Global Catppuccin theming";
    
    flavour = lib.mkOption {
      type = lib.ctp.types.flavourOption;
      default = "macchiato";
      description = "Global Catppuccin flavour";
    };

    accent = lib.mkOption {
      type = lib.ctp.types.accentOption;
      default = "blue";
      description = "Global Catppuccin accent";
    };
  };
}