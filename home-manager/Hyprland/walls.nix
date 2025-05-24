{ config, pkgs, ... }:

let
wall = ../../nonHomeManagerStuff/Walls/adwaita.webp;
activate_linux = ../../nonHomeManagerStuff/activate_linux;
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
        "ags run&"
        "qs -p ${activate_linux}"
      ];
    };
  };
}
