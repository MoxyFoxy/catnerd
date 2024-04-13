{
  description = "Soothing pastel theme for Nix";

  outputs = { self, ... }: let
    system = "x86_64-linux";
  in {
    homeManagerModules.catppuccin = import ./modules/home-manager;
    nixosModules.catppuccin = import ./modules/nixos;

    # packages.${system} = import ./packages;

    checks.${system}.default = import ./tests { inherit self; };
  };
}