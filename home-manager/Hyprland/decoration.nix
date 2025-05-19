{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        rounding = 10;
        inactive_opacity = 0.8;

        blur = {
          enabled = true;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 8;
          passes = 4;
          brightness = 1;
          noise = 0.01;
          contrast = 1;
          popups = true;
        };
        shadow = {
          enabled = true;
          range = 10;
          render_power = 3;
          color = "0xee1a1a1a";
          scale = 1.0;
        };
      };
    };
  };
}
