{ config, pkg, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        # "opacity 0.9 0.8, class:kitty"
      ];
    };
  };
}
