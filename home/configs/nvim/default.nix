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
      rev = "a10b603a2cd6d336412e996970e91566492562d2";
      sha256 = "UzrJhJk4zPk+VNUxma4qwsEGgZynfd4RPEk2mSbqQms=";
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
	onedark-vim
        vim-airline
        fzf-vim
        neomake
  
        # git
        blamer
	vim-fugitive
  
        # Languages
        # haskell-vim
        # vim-nix
  
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
