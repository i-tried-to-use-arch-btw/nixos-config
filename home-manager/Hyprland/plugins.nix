{ inputs, ... }:

{
  wayland.windowManager.hyprland = {
    extraConfig = ''
    plugin = ${inputs.hy3.packages.x86_64-linux.hy3}/lib/libhy3.so
    '';
  };
}
