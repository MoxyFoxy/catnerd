# Imports all packages in the directory
{ pkgs
, ...
}:

rec {
  catppuccin-grub = pkgs.callPackage ./catppuccin-grub { };
  catppuccin-hyprland = pkgs.callPackage ./catppuccin-hyprland { };
  catppuccin-hyprlock = pkgs.callPackage ./catppuccin-hyprlock { inherit catppuccin-hyprland; };
  catppuccin-plymouth = pkgs.callPackage ./catppuccin-plymouth { };
  catppuccin-rofi = pkgs.callPackage ./catppuccin-rofi { };
  catppuccin-swaync = pkgs.callPackage ./catppuccin-swaync { };
  catppuccin-tty = pkgs.callPackage ./catppuccin-tty { };
  catppuccin-waybar = pkgs.callPackage ./catppuccin-waybar { };
  catppuccin-xresources = pkgs.callPackage ./catppuccin-xresources { };
}