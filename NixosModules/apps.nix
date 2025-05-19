# apps.nix

{ config, pkgs, inputs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     google-chrome
     tor-browser
     vscode
     zsh
     home-manager
     tree
  ];
  # Install firefox.
  programs.firefox.enable = true;

  # Zsh.
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
