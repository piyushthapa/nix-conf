{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #system 
    socat	

    # Cli tools
    ripgrep fzf gnupg unzip curl wget  gcc agrep xclip silver-searcher updog kubectl magic-wormhole ngrok  zlib zlib.dev

    # terminal
    alacritty kitty

    # Haskell
    stylish-haskell

    # editors 
    vscode

    # Vscode
    vscode-extensions.github.copilot
    
    # Internet
    firefox brave tdesktop discord vlc zoom-us transmission-gtk

    # dev
    insomnia postman

    # db explorer
    robo3t jetbrains.datagrip dbeaver

    # Fonts
    jetbrains-mono

    # language servers
    rnix-lsp

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
