{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    # Allow Home manager to manage Zsh
    enable = true;
    enableCompletion = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/me/nixos-config/hosts#nixos";
      home-update = "home-manager switch --flake /home/me/nixos-config/#me";
      tmux = "tmux -u";
      u = "fzf";
      "ags-run" = "ags run --gtk4";
      "ags-init" = "ags init --gtk 4";
      a = "ls";
      ao = "ls -a";
    };

    oh-my-zsh = {
       enable = true;
       plugins = [
         "git"  # Example: Add a plugin like git
       ];
       # theme = "agnoster"; I use starship lmao
    };
  };
}
