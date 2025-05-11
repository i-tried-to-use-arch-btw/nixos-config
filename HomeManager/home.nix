{ config, pkgs, nixvim, inputs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";
  programs.nixvim.enable = true;
  
  # Imports

  imports = [
    ./Hyprland/hyprland.nix
    ./git.nix
    ./zsh.nix
    ./NeoVim/config/default.nix
    ./kitty.nix
    ./tmux.nix
    nixvim.homeManagerModules.nixvim
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fzf
    nerd-fonts.jetbrains-mono
    brightnessctl
    alsa-utils
    swww
    tmux
    ags
  ];

  home.file = {};

  home.sessionVariables = {};
  
  home.sessionPath = [
    "$HOME/.local/bin"
  ];


  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
