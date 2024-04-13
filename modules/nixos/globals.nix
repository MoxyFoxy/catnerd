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

    fonts = {
      package = lib.mkOption {
        type = lib.types.packageOption;
        default = "fira-code";
        description = "Global Catppuccin font package";
      };
      main = {
        font = lib.mkOption {
          type = lib.types.fontOption;
          default = "Fira Code";
          description = "Global Catppuccin main font";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Global Catppuccin main font size";
        };
      };
      mono = {
        font = lib.mkOption {
          type = lib.types.fontOption;
          default = "Fira Code";
          description = "Global Catppuccin terminal font";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Global Catppuccin terminal font size";
        };
      };
    };
  };
}