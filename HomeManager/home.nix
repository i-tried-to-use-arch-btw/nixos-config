{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";
  
  # Imports

  imports = [
    ./Hyprland/hyprland.nix
    ./git.nix
    ./zsh.nix
  ];

  home.packages = [
    pkgs.oh-my-zsh
  ];

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
