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
  };

  outputs = inputs@{ self, nixpkgs, hyprland, home-manager, nixvim, astal, ags, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      astalLibs = with astal.packages.${system}; [
        astal3
        hyprland
        io
      ];

      typelibPaths = pkgs.lib.makeSearchPath "lib/girepository-1.0" astalLibs;

    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/main/configuration.nix
        ];
      };

      homeConfigurations."me" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./HomeManager/home.nix ];
        extraSpecialArgs = {
          inherit nixvim inputs;
        };
      };

      packages.${system}.default = pkgs.stdenvNoCC.mkDerivation rec {
        pname = "my-shell";
        version = "1.0";
        src = ./.;

        nativeBuildInputs = [
          pkgs.nodejs
          pkgs.wrapGAppsHook
          pkgs.gobject-introspection
          ags.packages.${system}.default
        ];

        buildInputs = astalLibs;

        installPhase = ''
          mkdir -p $out/bin
          ags bundle app.ts $out/bin/${pname}
        '';

        dontWrapGApps = true;
        fixupPhase = ''
          makeWrapper $out/bin/${pname} $out/bin/${pname} \
            --set GI_TYPELIB_PATH ${typelibPaths}
        '';
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.gjs
          ags.packages.${system}.default
          pkgs.nodejs
        ] ++ astalLibs;

        shellHook = ''
          export GI_TYPELIB_PATH=${typelibPaths}
        '';
      };
    };
}

