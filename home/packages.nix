{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #system 
    socat
    git

    # Cli tools
    ripgrep
    fzf
    unzip
    curl
    wget
    gcc
    agrep
    xclip
    silver-searcher
    updog
    kubectl
    magic-wormhole
    ngrok
    zlib
    zlib.dev
    protonvpn-cli
    protonvpn-gui

    # terminal
    alacritty
    kitty
    zellij

    # editors 
    vscode

    # Vscode
    vscode-extensions.github.copilot

    # Internet
    firefox
    brave
    tdesktop
    discord
    vlc
    zoom-us
    transmission-gtk
    slack

    # dev
    insomnia

    # db explorer
    robo3t
    jetbrains.datagrip
    dbeaver-bin

    # Fonts
    jetbrains-mono

    # language servers

    # misc
    foliate
    libreoffice
    typst

    # languages
    python310
    deno

    #gnome extensions
    gnomeExtensions.gsconnect
    gruvbox-dark-gtk
    gnome.gnome-tweaks

    # Rust toolchain
    rustup

    protonvpn-cli
    cachix
    gpu-screen-recorder-gtk

    #Hyprland
    waybar
    fuzzel

  ];
}
