{ pkgs, lib, config, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 18;
    };
  
    themeFile = "gruvbox-dark";

    settings = {
      cursor_shape = "beam";
      enable_audio_bell = false;
      scrollback_lines = 5000;
      confirm_os_window_close = 0;
      background_opacity = 0.8;
      window_padding_width = 12;
    };
  };
}
