{ config, pkgs, nixvim, inputs, ... }:

let
  system = "x86_64-linux";
in
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
    inputs.quickshell.packages.${system}.default
  ];

  home.file = {};

  home.sessionVariables = {};
  
  home.sessionPath = [
    "$HOME/.local/bin"
  ];


  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
