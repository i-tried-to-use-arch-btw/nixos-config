{ config, pkgs, ... }:

let
  fuzzel = ../nonHomeManagerStuff/fuzzel/fuzzel.ini;
  hyprlock = ./Hyprland/hyprlock.conf;
in
{
  home.file.".config/fuzzel/fuzzel.ini" = {
    source = "${fuzzel}";
  };
  home.file.".config/hypr/hyprlock.conf" = {
    source = "${hyprlock}";
  };
}

