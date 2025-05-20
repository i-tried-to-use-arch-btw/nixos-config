{ config, pkgs, inputs, ... }:

let
  system = "x86_64-linux";
in
{
  home.username = "me";
  home.homeDirectory = "/home/me";
  
  # Imports

  imports = [
    ./Hyprland/hyprland.nix
    ./git.nix
    ./zsh.nix
    ./kitty.nix
    ./tmux.nix
    ./ags.nix
    ./starship.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fzf
    nerd-fonts.jetbrains-mono
    brightnessctl
    alsa-utils
    swww
    tmux
    gjs
    cascadia-code
    starship
    nerd-fonts.caskaydia-cove
    fastfetch
    neofetch
    uwufetch
    neovim
    gcc
  ];

  home.file = {};

  home.sessionVariables = {};
  
  home.sessionPath = [
    "$HOME/.local/bin"
  ];


  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
