{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "swaybg -i ../../Walls/gruvbox-nix.jpg -m fill"
      ];
    };
  };
}
