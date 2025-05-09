{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";

      bind = [
        # Launch applications
        "$mainMod, T, exec, kitty"
        "$mainMod, W, exec, wofi"
        "$mainMod, Q, killactive"

        # Window management
        "$mainMod, F, fullscreen"
        "$mainMod, P, togglesplit"
        "$mainMod SHIFT, P, togglepseudotile"
        "$mainMod SHIFT, SPACE, togglefloating"
        "$mainMod, R, submap, resize"

        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      bindm = [
        # Mouse controls
        "$mainMod, mouse:272, movewindow"    # Super + Left Click to move
        "$mainMod, mouse:273, resizewindow"  # Super + Right Click to resize
      ];

      # Resize submap (optional, as mouse resizing is now configured)
      submap = {
        resize = {
          binde = [
            ", right, resizeactive, 10 0"
            ", left, resizeactive, -10 0"
            ", up, resizeactive, 0 -10"
            ", down, resizeactive, 0 10"
            ", escape, submap, reset"
          ];
        };
      };
    };
  };
}

