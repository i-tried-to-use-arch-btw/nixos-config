{ pkgs, lib, config, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 18;
    };

    settings = {
      cursor_shape = "beam";
      enable_audio_bell = false;
      scrollback_lines = 5000;
      confirm_os_window_close = 0;
      background_opacity = 1;
      window_padding_width = 12;
    };

    extraConfig = ''
      background #161616
      foreground #DFDFDF
      cursor     #DFDFDF

      color0  #1C1C1C
      color1  #FF6C6B
      color2  #98BE65
      color3  #ECBE7B
      color4  #51AFEF
      color5  #C678DD
      color6  #46D9FF
      color7  #DFDFDF

      color8  #4B5263
      color9  #FF6C6B
      color10 #98BE65
      color11 #ECBE7B
      color12 #51AFEF
      color13 #C678DD
      color14 #46D9FF
      color15 #FFFFFF
    '';
  };
}

