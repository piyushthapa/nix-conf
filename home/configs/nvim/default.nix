{pkgs, config, lib, ... }:

let 

  ellis-gruvbox = pkgs.vimUtils.buildVimPlugin {
    name = "ellis-gruvbox";
    src = pkgs.fetchFromGitHub {
      owner = "ellisonleao";
      repo = "gruvbox.nvim";
      rev = "72930977a442a2de2592ed39168c018bef90e086";
      sha256 = "2XwfbqfiziJH8gObXeWlcfSUmCif4j+cGfFVPYld2cw=";
    };
  };

  blamer = pkgs.vimUtils.buildVimPlugin {
    name = "blamer";
    src = pkgs.fetchFromGitHub {
      owner = "APZelos";
      repo = "blamer.nvim";
      rev = "v1.3.0";
      sha256 = "uIrbnoS2llGjn/mLMftO4F6gss0xnPCE39yICd0N51Y=";
    };
  };

  coc-elixir = pkgs.vimUtils.buildVimPlugin {
    name = "coc-elixir";
    src = pkgs.fetchFromGitHub {
      owner = "elixir-lsp";
      repo = "coc-elixir";
      rev = "v0.7.0";
      sha256 = "uPQF9r1BM3yL4cPGE7kqAirN3jyY98YSWfZW9sPGvys=";
    };
  };

  vim-mix-format = pkgs.vimUtils.buildVimPlugin {
    name = "vim-mix-format";
    src = pkgs.fetchFromGitHub {
      owner = "mhinz";
      repo = "vim-mix-format";
      rev = "01a31ef82aa52697d589574da50723980eeae456";
      sha256 = "P6GNRVB9HOxY3JP8nW7Ax/b4LLTpteaxUzBtE5KrNyo=";
    };
  };
in
{
  enable = true;
  withNodeJs = true;  # coc
  vimAlias = true;
  withPython3 = true;
  package = pkgs.neovim-nightly;
  extraConfig = builtins.readFile ./init.vim;
  plugins = with pkgs.vimPlugins; [
        (nvim-treesitter.withPlugins (
          plugins: with plugins; [
            tree-sitter-nix
            tree-sitter-haskell
            tree-sitter-markdown
            tree-sitter-comment
            tree-sitter-svelte
            tree-sitter-json
            tree-sitter-rst
            tree-sitter-vim
          ]
        ))

        ellis-gruvbox
        vim-one
        vim-airline
        fzf-vim
        neomake
  
        # git
        blamer
  
        # Languages
        haskell-vim
        vim-nix
  
        # cmp related packages
        nvim-cmp
        cmp-nvim-lsp
        lspkind-nvim
        cmp-path
        cmp-buffer
        nvim-lspconfig

        # Elixir
        vim-mix-format
        vim-elixir
  ];
}
