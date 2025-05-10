{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "swaybg -i /home/me/nixos-config/Walls/space.png -m fill"
        "hyprctl setcursor Adwaita 24"
      ];
    };
  };
}
