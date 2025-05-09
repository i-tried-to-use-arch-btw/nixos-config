{ pkgs, config, lib, ... }:

{
  programs.nixvim = {
    # Import all your configuration modules here
    # imports = [ ./bufferline.nix ];
  
    colorschemes.gruvbox.enable = true;
  
    plugins = {
      lualine.enable = true;
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          pyright.enable = true;
          gopls.enable = true;
          rust_analyzer.enable = true;
          eslint.enable = true;
          lua_ls.enable = true;
        };
      };
    };
  };
}
