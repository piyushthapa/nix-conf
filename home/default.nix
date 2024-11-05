{ pkgs, ... }:

let
  vimsettings = import ./configs/nvim;
  kittysettings = import ./configs/kitty.nix;
  hyperlandsettings = import ./configs/hyprland;
  waybarsettings = import ./configs/hyprland/waybar;
  hyperlock_settings = import ./configs/hyprland/hyprlock.nix;
in
{

  imports = [ ./packages.nix ];

  programs.neovim = vimsettings pkgs;
  programs.kitty = kittysettings;
  wayland.windowManager.hyprland = hyperlandsettings pkgs;
  programs.waybar = waybarsettings;
  programs.hyprlock = hyperlock_settings;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.file = {
    ".config/efm-langserver/config.yaml".text = builtins.readFile ./configs/efm-langserver/config.yaml;

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
