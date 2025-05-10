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
          ts_ls.enable = true;
          pyright.enable = true;
          gopls.enable = true;
          eslint.enable = true;
          lua_ls.enable = true;
        };
      };
    };

    extraConfigLua = ''
      -- Clean UI
      vim.opt.fillchars:append { eob = " " }   -- No ~ on empty lines
      vim.opt.shortmess:append "I"             -- Disable startup message

      -- Tab size settings
      vim.opt.tabstop = 2         -- Number of spaces a tab counts for
      vim.opt.shiftwidth = 2      -- Number of spaces for each indentation
      vim.opt.expandtab = true    -- Convert tabs to spaces
      vim.wo.relativenumber = true
      vim.wo.number = true
    '';
  };
}
