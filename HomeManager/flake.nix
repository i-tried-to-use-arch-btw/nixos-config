{
  description = "Home Manager configuration of me";

  inputs = {
    # Main Nixpkgs input
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager input (follows nixpkgs to stay in sync)
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add the nvf input (Neovim config framework)
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, home-manager, nvf, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Define your Neovim configuration using nvf
      myNeovimConfig = nvf.lib.neovimConfiguration {
        inherit pkgs;

        # Custom configuration module
        modules = [
          {
            config.vim = {
              theme.enable = true;
              # You can add more nvf config here
            };
          }
        ];
      };
    in {
      # Your Home Manager configuration
      homeConfigurations."me" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Use your custom Neovim as a Home Manager package
        modules = [
          ./home.nix
          {
            home.packages = [ myNeovimConfig.neovim ];
          }
        ];
      };
    };
}
