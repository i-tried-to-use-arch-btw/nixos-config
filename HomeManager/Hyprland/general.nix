{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        border_size = 0;
        gaps_in = 10;
        gaps_out = 15;
      };
    };
  };
}
