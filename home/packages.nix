{ pkgs, ... }:


{
  home.packages = with pkgs; [
    #system 
    socat	git

    # Cli tools
    ripgrep fzf  unzip curl wget  gcc agrep xclip silver-searcher updog kubectl magic-wormhole ngrok  zlib zlib.dev

    # terminal
    alacritty kitty

    # Haskell
    stylish-haskell

    # editors 
    vscode lapce

    # Vscode
    vscode-extensions.github.copilot
    
    # Internet
    firefox brave tdesktop discord vlc zoom-us transmission-gtk slack

    # dev
    insomnia

    # db explorer
    robo3t jetbrains.datagrip dbeaver

    # Fonts
    jetbrains-mono

    # language servers

    # misc
    foliate  libreoffice

    # languages
    python310 deno

    #gnome extensions
    gnomeExtensions.gsconnect  gruvbox-dark-gtk

    # Rust toolchain
    rustup

    protonvpn-cli cachix gpu-screen-recorder-gtk

  ];
}
