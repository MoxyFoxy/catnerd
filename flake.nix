{
  description = "Automatic Nix theming using Catppuccin and NerdFonts.";

  #TODO Determine valid font types

  outputs = { self, ... }: let
    system = "x86_64-linux";
  in {
    homeManagerModules.catnerd = import ./modules/home-manager;
    nixosModules.catnerd = import ./modules/nixos;

    # packages.${system} = import ./packages;

    checks.${system}.default = import ./tests { inherit self; };
  };
}