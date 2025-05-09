{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    # Allow Home manager to manage Zsh
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ ];
    theme = "agnoster";
  };
}