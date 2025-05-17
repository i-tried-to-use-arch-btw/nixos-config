{ config, pkgs, inputs, ...}:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  hardware = {
    # Opengl
    #opengl.enable = true;
    # Most wayland compositors need this
    #nvidia.modesetting.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # Hyprland
    hyprland
    # Hyprpaper
    hyprpaper
    # Hyprpicker
    hyprpicker
    # Wofi the app launcher
    wofi
    # The terminal emulator
    kitty
  ];
}
