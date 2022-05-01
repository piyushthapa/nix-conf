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
    firefox brave tdesktop discord vlc zoom-us

    # bridges

    #dev
    git

    # GUI
    vlc

    # language servers
    elixir_ls haskell-language-server rnix-lsp
  ];
}
