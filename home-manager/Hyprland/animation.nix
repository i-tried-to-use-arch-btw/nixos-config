{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      animations = {
        enabled = true;

        animation = [
          "workspaces, 1, 5, workspaceChange, slide"
          "windowsIn, 1, 2, windowStart, popin 60%"
          "windowsOut, 1, 2, windowKill"
          "windowsMove, 1, 2, windowChange, popin 20%"
        ];

        bezier = [
          "workspaceChange, 0.075, 0.82, 0.165, 1"
          "windowChange, 0, 0, 0.06, 1"
          "windowStart, 0.05, 0.7, 0.1, 1"
          "windowKill, 0.3, 0, 0.8, 0.15"
        ];
      };
    };
  };
}
