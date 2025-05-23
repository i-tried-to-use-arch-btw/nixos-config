{ inputs, pkgs, ... }:

let
  ags = inputs.ags.packages.${pkgs.system};
in
  {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      apps
      auth
      battery
      bluetooth
      hyprland
      mpris
      network
      notifd 
      powerprofiles
      tray
      wireplumber

      pkgs.fzf
      pkgs.dart-sass
      pkgs.esbuild
    ];
  };  
}
