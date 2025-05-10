{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        border_size = 0;
        gaps_in = 7.5;
        gaps_out = 15;
      };
    };
  };
}
