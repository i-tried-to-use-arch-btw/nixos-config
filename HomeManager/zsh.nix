{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    # Allow Home manager to manage Zsh
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/me/nixos-config/hosts#nixos";
      home-update = "home-manager switch --flake /home/me/nixos-config/#me";
      tmux = "tmux -u";
      u = "fzf";
    };
    oh-my-zsh = {
       enable = true;
       plugins = [
         "git"  # Example: Add a plugin like git
       ];
       theme = "agnoster"; # Example: Choose a theme
     };
  };
}
