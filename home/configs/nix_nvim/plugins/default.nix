let
  lualinePlugin = import ./lualine.nix;
  telescopePlugin = import ./telescope.nix;
  lspPlugin = import ./lsp.nix;
  cmpPlugin = import ./cmp.nix;
  neogitPlugin = import ./neogit.nix;
  nvimTreePlugin = import ./nvim-tree.nix;

in {

  web-devicons.enable = true;

  lualine = lualinePlugin;
  telescope = telescopePlugin;
  lsp = lspPlugin;
  cmp = cmpPlugin;
  neogit = neogitPlugin;
  nvim-tree = nvimTreePlugin;

  indent-blankline = { enable = true; };
  treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      ensure_installed = "all";
      auto_install = true;
      highlight.enable = true;
      rainbow.enable = true;
    };
  };

  nvim-colorizer.enable = true;

  #copilot-lua = {
  #  enable = true;
  #  suggestion.keymap.accept = "<C-M>";
  #  suggestion.autoTrigger = true;
  #  panel.enabled = false;
  #  panel.keymap.accept = "<C-.>";
  #  panel.keymap.open = "<C-;>";
  #};

  gitsigns = {
    enable = true;
    settings = {
      current_line_blame = false;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
      };
      signcolumn = true;
      signs = {
        add = { text = "│"; };
        change = { text = "│"; };
        changedelete = { text = "~"; };
        delete = { text = "_"; };
        topdelete = { text = "‾"; };
        untracked = { text = "┆"; };
      };
      watch_gitdir = { follow_files = true; };
    };
  };

  luasnip = {
    enable = true;
    fromVscode = [ { } ];
  };

  floaterm = {
    enable = true;
    keymaps.toggle = "<C-`>";
  };

}

