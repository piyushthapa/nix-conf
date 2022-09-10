{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #system 
    socat

    # Cli tools
    ripgrep fzf gnupg unzip curl wget  gcc agrep xclip silver-searcher updog

    # terminal
    alacritty kitty

    # editors 
    vscode
    
    # Internet
    firefox brave tdesktop discord vlc zoom-us transmission-qt

    # dev
    insomnia postman

    # db explorer
    robo3t jetbrains.datagrip

    # Fonts
    jetbrains-mono

    # language servers
    elixir_ls haskell-language-server rnix-lsp

    #haskell
    cabal-install ghc stylish-haskell

    # misc
    foliate simplenote toggldesktop

    # languages
    python310 nodejs
  ];
}
