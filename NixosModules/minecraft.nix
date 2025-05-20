{ pkgs, lib, inputs, ... }: 

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    # enable = true;
    # eula = true;

    servers = {
      # survival = {
        # enable = true;
        # package = pkgs.vanillaServers.vanilla-1_21_5;

        # serverProperties = {
          # gamemode = "survival";
          # difficulty = "normal";
        # };
      # };
    };
  };
}
