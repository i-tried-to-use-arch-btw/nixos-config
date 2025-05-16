{ config, pkgs, nixvim, inputs, ... }:

let
  system = "x86_64-linux";
  astalLib = inputs.astal.packages.${pkgs.system}.hyprland;
  agsBin = inputs.ags.packages.${pkgs.system}.default;
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
    inputs.astal.packages.${system}.default
    inputs.astal.packages.${system}.hyprland
    inputs.ags.packages.${system}.default
    (pkgs.writeShellScriptBin "ags-run" ''
    export GI_TYPELIB_PATH="${astalLib}/lib/girepository-1.0${pkgs.gobject-introspection}/lib/girepository-1.0:$GI_TYPELIB_PATH"
    exec ${agsBin}/bin/ags "$@"
  '')
  ];

  home.file = {};

  home.sessionVariables = {};
  
  home.sessionPath = [
    "$HOME/.local/bin"
  ];


  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
