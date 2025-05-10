{ pkgs, ... }:

let
  bg = "#282828";
  fg = "#ebdbb2";
  bg2 = "#3c3836";
  fg2 = "#fbf1c7";

  currentWindow = let
    index = "#[reverse,fg=#d79921,bg=${fg}] #I ";
    name = "#[fg=${bg2},bg=${fg2}] #W ";
  in "${index}${name}";

  windowStatus = let
    index = "#[reverse,fg=#83a598,bg=${fg}] #I ";
    name = "#[fg=${bg2},bg=${fg2}] #W ";
  in "${index}${name}";

  time = let
    format = "%H:%M";
    icon = pkgs.writeShellScript "icon" ''
      hour=$(date +%H)
      case "$hour" in
        00|12) echo "󱑖" ;;
        01|13) echo "󱑋" ;;
        02|14) echo "󱑌" ;;
        03|15) echo "󱑍" ;;
        04|16) echo "󱑎" ;;
        05|17) echo "󱑏" ;;
        06|18) echo "󱑐" ;;
        07|19) echo "󱑑" ;;
        08|20) echo "󱑒" ;;
        09|21) echo "󱑓" ;;
        10|22) echo "󱑔" ;;
        11|23) echo "󱑕" ;;
      esac
    '';
  in "#[reverse,fg=#b8bb26] ${format} #(${icon}) ";

  pwd = "#[fg=#fabd2f] #[fg=${fg}]#{b:pane_current_path}";

  git = let
    icon = pkgs.writeShellScript "branchIcon" ''
      git -C "$1" rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo ""
    '';
    branch = pkgs.writeShellScript "branchName" ''
      git -C "$1" rev-parse --abbrev-ref HEAD 2>/dev/null
    '';
  in "#[fg=#d3869b]#(${icon} #{pane_current_path})#(${branch} #{pane_current_path})";

  separator = "#[fg=${fg}]|";

in {
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
    ];
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set-option -g default-terminal "screen-256color"
      set-option -g status-right-length 100
      set-option -g pane-active-border fg=#fe8019
      set-option -g pane-border-style fg=#504945
      set-option -g status-style "bg=${bg} fg=${fg}"
      set-option -g status-left-length 0
      set-option -g status-right "${git} ${pwd} ${separator} ${time}"
      set-option -g window-status-current-format "${currentWindow}"
      set-option -g window-status-format "${windowStatus}"
      set-option -g window-status-separator ""
    '';
  };
}

