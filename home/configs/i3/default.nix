{ pkgs, lib, ... }:
let mod = "Mod4";

in {
  enable = true;
  package = pkgs.i3-gaps;

  config = {
    bars = [{ mode = "invisible"; }];
    modifier = mod;
    terminal = "kitty";
    window = {
      border = 1;
      titlebar = false;
    };

    startup = [
      # TODO: disable only if external monitor is connected
      { command = "xrandr --output eDP --off"; }
      {
        command = "sh ~/.config/polybar/launch.sh";
        always = true;
      }
      {
        command = "feh --bg-scale ~/Documents/wallpapers/nixos-ascii-1.png";
        always = true;
      }
      # Map caps lock key to ESC
      { command = "setxkbmap -option caps:escape"; }
    ];

    keybindings = lib.mkOptionDefault {
      "${mod}+l" = "exec i3lock";
      "${mod}+space" = "exec rofi -show drun";

      # Disable laptop monitor
      "${mod}+Shift+m" = "exec xrandr --output eDP --off";

    };
  };
}
