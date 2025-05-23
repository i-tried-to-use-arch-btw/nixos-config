{ config, lib, pkgs, username, ... }:

{
  programs.zsh = {
    # Allow Home manager to manage Zsh
    enable = true;
    enableCompletion = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/${username}/nixos-config/hosts#main";
      home-update = "home-manager switch --flake /home/${username}/nixos-config/#me";
      tmux = "tmux -u";
      u = "fzf";
      "ags-run" = "ags run --gtk4";
      "ags-init" = "ags init --gtk 4";
      a = "ls";
      ao = "ls -a";
      vim = "nvim";
      hyprset = "hyprctl keyword";
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
