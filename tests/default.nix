{ pkgs, ... }:

let
  system = "x86_64-linux";
  flake = import ../flake.nix;
in
pkgs.nixosTest {
  name = "catppuccin";
  machine = { pkgs, ... }: {
    imports = [
      flake.nixosModules.catppuccin
    ];

    users.users.test = {
      isNormalUser = true;
      home.stateVersion = "23.05";
      extraGroups = [ "wheel" ]; # for sudo
    };

    services.home-manager.users.test = {
      enable = true;
      home.file.".config/nixpkgs/home.nix".source = flake.homeManagerModules.catppuccin;
    };

    # Set some configuration attributes to test your modules
    # services.yourService.enable = true;
    # ...
  };
}