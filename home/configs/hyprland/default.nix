{ pkgs, ... }:

{
  enable = true;
  plugins = [ pkgs.hyprlandPlugins.hyprbars ];
  systemd.variables = [ "--all" ];
  settings = {
    "$mod" = "SUPER";
    monitor = [
      "eDP-1, 1920x1200@60, 0x0, 1"
      #"DP-2, 2560x1440@60, 1920x0, 1"
      "DP-10, 2560x1440@60, 1920x0, 1"
      "DP-7, 2560x1440@60, 4480x0, 1"

    ];
    input = { kb_layout = "us"; };
    exec-once = [
      "systemctl --user start graphical-session.target"
      "sh ~/.scripts/toggle-monitor.sh"
    ];
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 3;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";
    };

    bind = [
      "$mod, T, exec, kitty"
      "$mod, SPACE, exec, fuzzel"
      "$mod, F, exec, dolphin"
      "$mod, L, exec, hyprlock"

      # Kill current window
      "$mod, Q, exec, hyprctl activewindow |grep pid |tr -d 'pid:'|xargs kill"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

      # toggle workspace 
      "$mod, TAB, workspace, previous"
    ];

    bindl = [
      # trigger when laptop lid is closed is turning on
      ", switch:on:lid, exec, hyprctl keyword monitor 'eDP-1, disable'"

      # trigger when the switch is turning off
      ", switch:off:lid, exec, hyprctl keyword monitor 'eDP-1, 1920x1200@60, 0x0, 1'"
    ];
  };

}
