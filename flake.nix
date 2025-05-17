{
  description = "NixOS config flake with mymeShell and Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    myflake.url = "./ags";
  };

  outputs = inputs@{ self, nixpkgs, hyprland, home-manager, nixvim, astal, ags, myflake, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/main/configuration.nix
          myflake.nixosModules.default
        ];
      };

      homeConfigurations."me" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./HomeManager/home.nix ];
        extraSpecialArgs = {
          inherit nixvim inputs;
        };
      };
    };
}

