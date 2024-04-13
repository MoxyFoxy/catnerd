{ self
, ...
}:

let
  nixpkgs = builtins.fetchTarball "https://github.com/nixOS/nixpkgs/archive/23.11.tar.gz";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";

  pkgs = (import nixpkgs {}).extend(_: _: self.packages."x86_64-linux");
  lib = lib.extend(_: _: import ./lib);
in
pkgs.nixosTest {
  name = "catppuccin";

  testScript = ''
    machine.start()
    machine.wait_for_unit("home-manager-test.service")
    machine.wait_until_succeeds("systemctl status home-manager-test.service")
    machine.succeed("echo \"system started!\"")
  '';


  nodes.machine = { config, pkgs, ... }: {
    system.stateVersion = "23.11";
    imports = [
      (import "${home-manager}/nixos")
      self.nixosModules.catppuccin
    ];

    users.users.test = {
      isNormalUser = true;
      home = "/home/test";
    };

    # Test nixos module here
    boot.loader = {
      grub.enable = true;
    };


    programs.dconf.enable = true; # required for gtk
    home-manager.users.test = {
      home.stateVersion = "23.11";
      imports = [
        self.homeManagerModules.catppuccin
      ];
      xdg.enable = true;

      manual.manpages.enable = false;

      catppuccin = {
        enable = false;
        flavour = "macchiato";
        accent = "blue";
      };

      # Test home-manager module here
      home.packages = [
        pkgs.swaynotificationcenter
      ];
      programs = {
        alacritty.enable = true;
        bat.enable = true;
        bottom.enable = true;
        btop.enable = true;
        fish.enable = true;
        fzf.enable = true;
        git.enable = true; # Required for delta
        git.delta.enable = true;
        gitui.enable = true;
        # glamour.catppuccin.enable = true;
        helix.enable = true;
        home-manager.enable = false;
        imv.enable = true;
        kitty.enable = true;
        lazygit.enable = true;
        micro.enable = true;
        neovim.enable = true;
        rofi.enable = true;
        starship.enable = true;
        swaylock.enable = true;
        tmux.enable = true;
        yazi.enable = true;
        zathura.enable = true;
      };
    };
  };
}