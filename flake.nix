{
  description = "Automatic Nix theming using Catppuccin and NerdFonts.";

  outputs = { self, ... }: let
    system = "x86_64-linux";
  in {
    homeManagerModules.catnerd = import ./modules/home-manager;
    nixosModules.catnerd = import ./modules/nixos;

    checks.${system}.default = import ./tests { inherit self; };
  };
}