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
    firefox brave tdesktop discord vlc zoom-us

    #dev
    git jetbrains.datagrip

    # GUI
    vlc

    # Fonts
    jetbrains-mono

    # language servers
    elixir_ls haskell-language-server rnix-lsp
  ];
}
