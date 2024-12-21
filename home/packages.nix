{ pkgs, ... }:

let
  polybar_full = pkgs.polybar.overrideAttrs (old: {
    alsaSupport = true;
    iwSupport = true;
    githubSupport = true;
    pulseSupport = true;
    nlSupport = true;
    i3Support = true;
  });

in
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
    transmission_4-gtk
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
    efm-langserver

    # misc
    foliate
    libreoffice
    typst
    pavucontrol
    openshot-qt
    obs-studio
    ranger

    # languages
    python310
    deno

    # Rust toolchain
    rustup

    protonvpn-cli
    cachix
    gpu-screen-recorder-gtk

    #Hyprland
    # waybar
    # fuzzel

    # i3
    polybar_full
    feh

  ];
}
