{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        blur = {
          enabled = true;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 14;
          passes = 4;
          brightness = 1;
          noise = 0.01;
          contrast = 1;
          popups = true;
          popups_ignorealpha = 0.6;
        };
      };
    };
  };
}
