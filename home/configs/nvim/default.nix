{pkgs, config, lib, ... }:

let 

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
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./init.vim;
  plugins = with pkgs.vimPlugins; [
        gruvbox-nvim 
        vim-airline
        nvim-treesitter
        fzf-vim
        neomake
  
        # git
        blamer
  
        # Languages
        haskell-vim
        vim-nix
        coc-nvim
  
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
        coc-elixir
  ];

}
