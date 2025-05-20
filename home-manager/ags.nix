{ inputs, pkgs, ... }:

let
  ags = inputs.ags.packages.${pkgs.system};
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      ags.apps
      ags.battery
      ags.bluetooth
      ags.cava
      ags.greet
      ags.hyprland
      ags.mpris
      ags.network
      ags.notifd
      ags.powerprofiles
      ags.river
      ags.tray
      ags.wireplumber
    ];
  };
}
