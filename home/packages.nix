{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Cli tools
    ripgrep fzf gnupg unzip curl wget  gcc agrep

    # terminal
    alacritty tmux 

    # editors 
    vscode
    
    # Internet
    firefox brave tdesktop discord vlc zoom-us transmission-qt

    # dev
    git 

    # db explorer
    robo3t jetbrains.datagrip

    # Fonts
    jetbrains-mono

    # language servers
    elixir_ls haskell-language-server rnix-lsp

    # misc
    foliate

  ];
}
