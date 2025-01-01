let
  lualinePlugin = import ./lualine.nix;
  telescopePlugin = import ./telescope.nix;
  lspPlugin = import ./lsp.nix;
  neogitPlugin = import ./neogit.nix;
  nvimTreePlugin = import ./nvim-tree.nix;

in {

  web-devicons.enable = true;
  lualine = lualinePlugin;
  telescope = telescopePlugin;
  lsp = lspPlugin;
  neogit = neogitPlugin;
  nvim-tree = nvimTreePlugin;
  blink-cmp = import ./blink_cmp.nix;

  indent-blankline = { enable = true; };
  treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      ensure_installed = [
        "c"
        "bash"
        "html"
        "lua"
        "markdown"
        "markdown_inline"
        "vim"
        "vimdoc"
        "elixir"
        "haskell"
        "typescript"
        "rust"
        "elm"
        "go"
        "zig"
      ];
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

  none-ls = {
    enable = true;
    # Enable prettierd for js files
    sources.formatting.prettierd = {
      enable = true;
      disableTsServerFormatter = true;
    };
  };

}

