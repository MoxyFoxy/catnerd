{ self
}:

let
  nixpkgs = builtins.fetchTarball "https://github.com/nixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";

  pkgs = import nixpkgs {};
in
pkgs.nixosTest {
  name = "catppuccin";

  testScript = ''
    machine.start()
    machine.wait_for_unit("home-manager-test.service")
    machine.wait_until_succeeds("systemctl status home-manager-test.service")
    machine.succeed("echo \"system started!\"")
  '';


  nodes.machine = { config, lib, pkgs, ... }: {
    system.stateVersion = "23.11";
    imports = [
      (import "${home-manager}/nixos")
      (self.nixosModules.catnerd { inherit config lib pkgs; })
    ];

    catnerd = {
      enable = true;

      flavour = "macchiato";
      accent = "blue";

      fonts = {
        main = {
          family = "Ubuntu";
          size = 14;
        };
        mono = {
          family = "DroidSansM";
          size = 10;
        };
      };
    };

    users.users.test = {
      isNormalUser = true;
      home = "/home/test";
    };

    # Test nixos module here
    boot = {
      loader.grub.enable = true;
      plymouth.enable = true;
    };


    programs.dconf.enable = true; # required for gtk
    home-manager.users.test = {
      home.stateVersion = "23.11";
      imports = [
        (self.homeManagerModules.catnerd { inherit config lib pkgs;})
      ];
      xdg.enable = true;

      manual.manpages.enable = false;

      catnerd = {
        enable = true;

        flavour = "macchiato";
        accent = "blue";

        fonts = {
          main = {
            family = "Ubuntu";
            size = 14;
          };
          mono = {
            family = "DroidSansM";
            size = 10;
          };
        };
      };

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
    };
  };
}