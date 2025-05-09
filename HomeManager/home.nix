{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";
  
  # Imports

  imports = [
    # Hyprland
    ./Hyprland/hyprland.nix
    # Git
    ./git.nix
    # NeoVim / NVF
    ./NeoVim/nvf-configuration.nix
  ];

  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
