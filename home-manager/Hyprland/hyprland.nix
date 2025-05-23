{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";
      input = {
        kb_layout = "us";
        kb_variant = "dvorak";
        kb_options = "grp:alt_shift_toggle";
      };
      bind = [
        # Launch applications
        "$mainMod, Y, exec, kitty"
        "$mainMod, W, exec, wofi --show drun"
        "$mainMod, Q, killactive"
        
        # Hyprland stuff
        "$mainMod, M, exec, hyprctl dispatch exit"
        "$mainMod, L, exec, hyprlock"

        # Launch clipborad
        "$mainMod, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

        # Color colorpicker
        "$mainMod, P, exec, hyprpicker -a"

        # Brightness
        "ALT, F2, exec, brightnessctl s 5%-"
        "ALT, F3, exec, brightnessctl s 5%+"

        # Audio
        "ALT, F5, exec, amixer -D pipewire toggle Master"
        "ALT, F6, exec, amixer -D pipewire sset Master 5%-"
        "ALT, F7, exec, amixer -D pipewire sset Master 5%+"

        # Window management
        "$mainMod, F, fullscreen"
        "$mainMod, P, togglesplit"
        "$mainMod , SPACE, togglefloating"
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
            "$mainMod, right, resizeactive, 10 0"
            "$mainMod, left, resizeactive, -10 0"
            "$mainMod, up, resizeactive, 0 -10"
            "$mainMod, down, resizeactive, 0 10"
            "$mainMod, escape, submap, reset"
          ];
        };
      };
    };
  };
  imports = [
    ./walls.nix
    ./trash.nix
    ./windowrules.nix
    ./decoration.nix
    ./general.nix
    ./animation.nix
    ./plugins.nix
  ];
}

