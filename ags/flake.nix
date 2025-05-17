{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, astal, ags }: {
    nixosModules.default = { config, pkgs, lib, ... }: {
      config = {
        environment.systemPackages = with pkgs; [
          ags.packages.${pkgs.system}.default
          astal.packages.${pkgs.system}.astal3
          astal.packages.${pkgs.system}.io
        ];

        environment.variables = {
          # Optional: set XDG-related variables or GIO extras here
        };

        # Optional: wrap AGS if needed
        programs.dconf.enable = true; # Needed by some GTK/GSettings stuff
      };
    };
  };
}

