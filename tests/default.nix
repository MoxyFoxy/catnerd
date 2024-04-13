{ self
}:

let
  nixpkgs = builtins.fetchTarball "https://github.com/nixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";

  pkgs = import nixpkgs {};
in
pkgs.nixosTest {
  name = "catnerd";

  testScript = ''
    machine.start()
    machine.wait_for_unit("home-manager-test.service")
    machine.wait_until_succeeds("systemctl status home-manager-test.service")
  '';


  nodes.machine = { config, lib, pkgs, ... }: {
    users.users.test = {
      isNormalUser = true;
      home = "/home/test";
    };

    system.stateVersion = "23.11";
    imports = [
      (import "${home-manager}/nixos")
      (self.nixosModules.catnerd { inherit config lib pkgs; })
    ];
    catnerd.enable = true;

    programs.dconf.enable = true; # required for gtk

    # Test nixos module here
    boot = {
      loader.grub.enable = true;
      plymouth.enable = true;
    };

    home-manager.users.test = {
      home.stateVersion = "23.11";
      imports = [
        (self.homeManagerModules.catnerd { inherit config lib pkgs;})
      ];
      catnerd.enable = true;

      # Test home-manager module here
      home.packages = with pkgs; [
        hyprlock
        swaynotificationcenter
      ];
      programs = {
        home-manager.enable = false;
        git.enable = true; # Required for delta
        
        kitty.enable = true;
        rofi.enable = true;
        waybar.enable = true;
      };
      wayland.windowManager = {
        hyprland = {
          enable = true;
          settings.source = [];
        };
      };
      xdg.enable = true;
      gtk.enable = true;
      qt.enable = true;
    };
  };
}