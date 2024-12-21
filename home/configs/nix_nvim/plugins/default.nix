let
  lualinePlugin = import ./lualine.nix;
  telescopePlugin = import ./telescope.nix;
  lspPlugin = import ./lsp.nix;

in {
  web-devicons.enable = true;
  lualine = lualinePlugin;
  telescope = telescopePlugin;
  treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      ensure_installed = "all";
      auto_install = true;
    };
  };
  lsp = lspPlugin;

}

