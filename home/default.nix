{ pkgs, ... }:

let
  vimsettings = import ./configs/nvim;
  kittysettings = import ./configs/kitty.nix;
  hyperlandsettings = import ./configs/hyperland;
  waybarsettings = import ./configs/hyperland/waybar;
in {

  imports = [ ./packages.nix ];

  programs.neovim = vimsettings pkgs;
  programs.kitty = kittysettings;
  wayland.windowManager.hyprland = hyperlandsettings pkgs;
  programs.waybar = waybarsettings;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "Gruvbox dark";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
