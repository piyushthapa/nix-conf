{config, pkgs, ... }:

let 
  vimsettings = import ./configs/nvim;
  kittysettings = import ./configs/kitty.nix;
in
{
  imports = [
    ./packages.nix
  ];

  programs.neovim = vimsettings pkgs;
  programs.kitty = kittysettings pkgs;

  home.sessionVariables = {
    TERMINAL="kitty";
  };
}
