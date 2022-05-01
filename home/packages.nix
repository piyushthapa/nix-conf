{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Cli tools
    ripgrep fzf gnupg unzip curl wget  gcc

    # terminal
    alacritty tmux 

    # editors 
    vscode
    
    # Internet
    firefox brave tdesktop discord vlc

    # bridges

    #dev
    git

    # GUI
    vlc
  ];
}
