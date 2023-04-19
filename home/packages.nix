{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #system 
    socat zlib zlib.dev

    # Cli tools
    ripgrep fzf gnupg unzip curl wget  gcc agrep xclip silver-searcher updog kubectl magic-wormhole ngrok

    # terminal
    alacritty kitty

    # editors 
    vscode
    
    # Internet
    firefox brave tdesktop discord vlc zoom-us transmission-qt

    # dev
    insomnia postman

    # db explorer
    robo3t jetbrains.datagrip pgadmin4 dbeaver

    # Fonts
    jetbrains-mono

    # language servers
    elixir_ls rnix-lsp

    #haskell
    cabal-install ghc stylish-haskell

    # misc
    foliate simplenote libreoffice

    # languages
    python310 

    #gnome extensions
    gnomeExtensions.gsconnect  gruvbox-dark-gtk

    # Rust toolchain
    rustup

    protonvpn-cli
  ];
}
