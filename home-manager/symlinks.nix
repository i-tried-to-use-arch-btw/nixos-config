{ config, pkgs, ... }:

let
  sourcePath = ../nonHomeManagerStuff/fuzzel/fuzzel.ini;
in
{
  home.file.".config/fuzzel/fuzzel.ini" = {
    source = "${sourcePath}";
  };
}

