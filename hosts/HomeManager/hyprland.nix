{ config, pkgs, ...}:

{
  wayland.windowmanagers.hyprland = {
    # Allows HomeManger to manage Hyprland
    enable = true;
    xwayland.enable = true;

    settings = {
      input = {
        kb_layout = "us";
        kb_variant = "dvorak";
      };
    };
  };
}