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

  vim-mix-format = pkgs.vimUtils.buildVimPlugin {
    name = "vim-mix-format";
    src = pkgs.fetchFromGitHub {
      owner = "mhinz";
      repo = "vim-mix-format";
      rev = "01a31ef82aa52697d589574da50723980eeae456";
      sha256 = "P6GNRVB9HOxY3JP8nW7Ax/b4LLTpteaxUzBtE5KrNyo=";
    };
  };

 nvim-treesitter = pkgs.vimUtils.buildVimPlugin {
    name = "treesitter";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "91725df58155d47c5b65cd4847d0ccac86d39cac";
      sha256 = "x5Iv4cKOmbOfKgQDxxcmxCF1iqLW5W69m5lV28/0ZUc=";
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

      nvim-treesitter
      gruvbox-nvim
      onedark-vim
      lightline-vim
      lightline-gruvbox-vim
      fzf-vim
      neomake
  
      blamer
      vim-fugitive
  
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

      # Haskell
      vim-stylish-haskell 
  ];
}
