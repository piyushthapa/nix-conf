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


  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdgOpenUsePortal = true;
  };

  xdg.portal.config.common.default = "*";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.file = {
    ".config/efm-langserver/config.yaml".text = builtins.readFile ./configs/efm-langserver/config.yaml;
    ".scripts/toggle-monitor.sh".text = builtins.readFile ./configs/scripts/toggle-monitor.sh;
  };
}
