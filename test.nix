{ pkgs, ... }:

{
  imports = [
    # Import your flake
    (import ./flake.nix).nixosModules.catppuccin
  ];

  users.users.test = {
    isNormalUser = true;
    home.stateVersion = "23.05";
    extraGroups = [ "wheel" ]; # for sudo
  };

  services.home-manager.users.test = {
    enable = true;
    home.file.".config/nixpkgs/home.nix".source = (import ./flake.nix).homeManagerModules.catppuccin;
  };
}