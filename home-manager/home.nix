{ config, pkgs, inputs, username, ... }:

let
  system = "x86_64-linux";
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  
  # Imports

  imports = [
    ./Hyprland/hyprland.nix
    ./zsh.nix
    ./kitty.nix
    ./tmux.nix
    ./ags.nix
    ./starship.nix
    ./symlinks.nix
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra; # Needed for Adwaita-dark
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

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
    hyprpicker
    hyprshot
    cliphist
    fuzzel
    wl-clipboard
    btop
    hyprlock
    unzip
    nodejs
    brave
    wofi
    libnotify
  ];

  home.file = {};

  home.sessionVariables = {};
  
  home.sessionPath = [
    "$HOME/.local/bin"
  ];


  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
