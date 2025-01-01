{
  enable = true;
  keymaps.lspBuf = {
    "gD" = "declaration";
    "gd" = "definition";
    "K" = "hover";
    "gi" = "implementation";
    "<C-k>" = "signature_help";
    "<leader>wa" = "add_workspace_folder";
    "<leader>wr" = "remove_workspace_folder";
  };

  capabilities = ''
    require('blink.cmp').get_lsp_capabilities()
  '';

  servers = {
    aiken = {
      enable = true;
      cmd = [ "aiken" "lsp" ];
      filetypes = [ "aiken" "ak" ];
      rootDir = "require('lspconfig.util').root_pattern('aiken.toml')";
      package = null;
    };

    bashls = { enable = true; };

    # LSP to support Credo in Elixir
    efm = {
      enable = true;
      filetypes = [ "elixir" ];
    };

    elixirls = {
      enable = true;
      extraOptions = {
        "elixirLS" = {
          dialyzerEnabled = false;
          fetchDeps = false;
        };
      };
    };

    html = { enable = true; };
    hls = {
      enable = true;
      installGhc = false;
    };

    ts_ls = { enable = true; };

    nil_ls = { 
      enable = true; 
      settings = {
        formatting = { 
          command = ["nixfmt"];
        };
      };
    };

    lua_ls = { enable = true; };
  };

}
