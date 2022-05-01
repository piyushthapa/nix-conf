{config, pkgs, ... }:

let 
  vimsettings = import ./configs/nvim;
in
{
  imports = [
    ./packages.nix
  ];

  programs.neovim = vimsettings pkgs;

  programs.tmux = {
    enable = true;
    clock24= true;
    newSession = true;
    extraConfig =  ''
      bind-key -n C-Tab next-window
    '';
  };
}
