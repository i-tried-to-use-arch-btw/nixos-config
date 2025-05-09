{ pkg, lib, config, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
     size = 12;
   };
  
   themeFile = "./Themes/gruvbox-dark.conf";
  
   settings = {
     cursor_shape = "beam";
      enable_audio_bell = false;
      scrollback_lines = 5000;
      confirm_os_window_close = 0;
    };
  };
}
