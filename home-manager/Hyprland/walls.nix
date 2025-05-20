{ config, pkgs, ... }:

let
wall = ../../nonHomeManagerStuff/Walls/space.png;
in

{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "swww-daemon"
        "swww img ${wall}" 
        "hyprctl setcursor Adwaita 24"
        "wl-paste --watch cliphist store --type text &"
        "wl-paste --watch cliphist store --type image&"
      ];
    };
  };
}
