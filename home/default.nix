{config, pkgs, ... }:

let 
  vimsettings = import ./configs/nvim;
  rofi_settings = import ./programs/rofi;
  kittysettings = import ./configs/kitty.nix;
in
{
  imports = [
    ./packages.nix
  ];

  programs.neovim = vimsettings pkgs;
  programs.kitty = kittysettings pkgs;
  programs.rofi = rofi_settings pkgs;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "Gruvbox dark";
    }; 
  };
}
