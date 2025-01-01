{ pkgs, ... }:

let
  kittysettings = import ./configs/kitty.nix;
  i3settings = import ./configs/i3;
  nixvimsettings = import ./configs/nix_nvim;
in {

  imports = [ ./packages.nix ];

  programs.kitty = kittysettings;
  programs.rofi = { enable = true; };

  programs.nixvim = nixvimsettings pkgs;

  # Enable Xorg Compositor
  services.picom = {
    enable = true;
    vSync = true;
  };

  xsession.windowManager.i3 = i3settings pkgs;

  #services.polybar = {
  #  enable = true;
  #  script = "";
  #  package = pkgs.polybar.override {
  #    alsaSupport = true;
  #    iwSupport = true;
  #    githubSupport = true;
  #    pulseSupport = true;
  #    nlSupport = true;
  #    i3Support = true;
  #  };
  #};

  home.file = {
    ".config/efm-langserver/config.yaml".text =
      builtins.readFile ./configs/efm-langserver/config.yaml;
    ".config/polybar/config.ini".text =
      builtins.readFile ./configs/i3/polybar/polybar.ini;
    ".config/polybar/launch.sh".text =
      builtins.readFile ./configs/i3/polybar/launch_polybar.sh;
    ".scripts/toggle-monitor.sh".text =
      builtins.readFile ./configs/scripts/toggle-monitor.sh;
  };
}
