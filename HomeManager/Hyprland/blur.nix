{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        blur = yes;
        blur_size = 10;
        blur_passes = 2;
        blur_new_optimizations = yes;
      };
    };
  };
}
