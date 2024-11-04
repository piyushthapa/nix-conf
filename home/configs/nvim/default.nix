{ pkgs, ... }:

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
    name = "my-nvim";
    src = ../../../config/nvim;
  };

in
{
  enable = true;
  withNodeJs = true; # coc
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
    haskell-tools-nvim

    # Git
    blamer
    gitsigns-nvim

    # theme
    catppuccin-nvim
    gruvbox

    # terminal
    vim-floaterm

    indent-blankline-nvim

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

    # Auto completion
    nvim-cmp
    cmp-nvim-lsp
    cmp_luasnip
    luasnip
    cmp-buffer
    cmp-path
    friendly-snippets


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
