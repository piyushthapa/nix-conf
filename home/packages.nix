{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Cli tools
    ripgrep fzf gnupg unzip curl wget  gcc agrep xclip silver-searcher

    # terminal
    alacritty kitty

    # editors 
    vscode
    
    # Internet
    firefox brave tdesktop discord vlc zoom-us transmission-qt

    # dev
    insomnia

    # db explorer
    robo3t jetbrains.datagrip

    # Fonts
    jetbrains-mono

    # language servers
    elixir_ls haskell-language-server rnix-lsp

    #haskell
    cabal-install ghc

    # misc
    foliate simplenote
  ];
}
