{
  description = "Soothing pastel theme for Nix";

  outputs = { self }:
  let
    system = "x86_64-linux";
    packageDirs = builtins.readDir ./packages;  # Get all directories in ./packages
    pkgs = builtins.mapAttrs (name: _: import ./packages/${name}) packageDirs;  # Import each package
  in
  {
    homeManagerModules.catppuccin = import ./modules/home-manager;
    nixosModules.catppuccin = import ./modules/nixos;

    packages.${system} = pkgs;
  };
}