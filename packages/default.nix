# Imports all packages in the directory
{ callPackage
, ...
}:

rec {
  catppuccin-grub = callPackage ./catppuccin-grub { };
  catppuccin-hyprland = callPackage ./catppuccin-hyprland { };
  catppuccin-hyprlock = callPackage ./catppuccin-hyprlock { inherit catppuccin-hyprland; };
  catppuccin-plymouth = callPackage ./catppuccin-plymouth { };
  catppuccin-rofi = callPackage ./catppuccin-rofi { };
  catppuccin-swaync = callPackage ./catppuccin-swaync { };
  catppuccin-tty = callPackage ./catppuccin-tty { };
  catppuccin-waybar = callPackage ./catppuccin-waybar { };
  catppuccin-xresources = callPackage ./catppuccin-xresources { };
}