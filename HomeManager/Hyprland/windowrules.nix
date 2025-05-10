{ config, pkg, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
      ];
      windowrulev2 = [
        "opacity 0.8, class:kitty, title:kitty"
      ];
    };
  };
}
