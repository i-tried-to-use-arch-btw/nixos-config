{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "swaybg -i /home/me/nixos-config/Walls/gruvbox-nix.jpg -m fill"
        "hyprctl setcursor Adwaita 24"
      ];
    };
  };
}
