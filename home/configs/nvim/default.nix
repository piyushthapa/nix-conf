{pkgs, ... }:

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

  aiken-lang = pkgs.vimUtils.buildVimPlugin {
    name = "aiken-lang";
    src = pkgs.fetchFromGitHub {
      owner = "aiken-lang";
      repo = "editor-integration-nvim";
      rev = "259203266da4ef367a4a41baa60fe49177d55598";
      sha256 = "vlhqunKmQTUGPCPq3sSW3QOKJgnAwQdFnGzWKEjGNzE=";
    };
  };

  my-nvim = pkgs.vimUtils.buildVimPlugin {
    name  = "my-nvim";
    src = ../../../config/nvim;
  };



in
{
  enable = true;
  withNodeJs = true;  # coc
  vimAlias = true;
  withPython3 = true;
  extraConfig = ''
    lua <<EOF
      require 'Plugins'.init()
    EOF
  '';

  plugins = with pkgs.vimPlugins; [

    # languages
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
    rust-tools-nvim
    aiken-lang
    vim-mix-format 
    haskell-tools-nvim

    # Git
    blamer
    gitsigns-nvim

    # theme
    catppuccin-nvim

    # terminal
    vim-floaterm

    # telescope
    plenary-nvim
    popup-nvim
    telescope-nvim

    # Misc
    lualine-nvim
    nvim-colorizer-lua
    nvim-notify
    ChatGPT-nvim
    copilot-lua
    nerdcommenter
    nvim-treesitter-context
    nvim-tree-lua
    nvim-web-devicons
    kanagawa-nvim


    # My lua configuration
    my-nvim
  ];

  extraPackages = with pkgs; [
      # language servers
      jsonnet-language-server
      lua-language-server
      nil
      nodePackages."bash-language-server"
      nodePackages."diagnostic-languageserver"
      nodePackages."dockerfile-language-server-nodejs"
      nodePackages."typescript"
      nodePackages."typescript-language-server"
      nodePackages."vscode-langservers-extracted"
      nodePackages."yaml-language-server"
      rust-analyzer

      # formatters
      nixpkgs-fmt
      rustfmt
      terraform

      # tools
      cargo
      fd
      gcc
      ghc
      lazydocker
      yarn
  ]; 
}
