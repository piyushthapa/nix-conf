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
    firefox brave

    #dev
    git

    # GUI
    vlc
  ];
}
