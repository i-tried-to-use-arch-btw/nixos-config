{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    # Allow HomeManager to manage Hyprland
    enable = true;
    settings = {
      "$mainMod" = "Super";
      
    };
  }; 
}