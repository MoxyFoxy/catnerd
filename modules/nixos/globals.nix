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

    nerdfonts = {
      main = {
        font = lib.mkOption {
          type = lib.types.mainFontOption;
          default = "Ubuntu";
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
          type = lib.types.monoFontOption;
          default = "UbuntuMono";
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