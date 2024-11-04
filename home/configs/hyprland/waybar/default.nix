{
  enable = true;
  systemd.enable = true;
  style = ''
    ${builtins.readFile ./waybar.css}
  '';
  settings = [{
    height = 30;
    layer = "top";
    position = "top";
    tray = { spacing = 10; };
    modules-center = [ "hyprland/window" ];

    modules-left = [ "hyprland/workspaces" ];

    modules-right = [
      "pulseaudio"
      "network"
      "cpu"
      "memory"
      "temperature"
      "battery"
      "clock"
      "tray"
    ];

    battery = {
      format = "{capacity}% {icon}";
      format-alt = "{time} {icon}";
      format-charging = "{capacity}% ";
      format-icons = [ "" "" "" "" "" ];
      format-plugged = "{capacity}% ";
      states = {
        critical = 15;
        warning = 30;
      };
    };
    clock = { format = "{:%H:%M}"; };
    cpu = {
      format = "{usage}% ";
      tooltip = false;
    };
    memory = { format = "{}% "; };

    network = {
      interval = 1;
      format-alt = "{ifname}= {ipaddr}/{cidr}";
      format-disconnected = "Disconnected ⚠";
      format-ethernet =
        "{ifname}= {ipaddr}/{cidr}   up= {bandwidthUpBits} down= {bandwidthDownBits}";
      format-linked = "{ifname} (No IP) ";
      format-wifi = "{essid} ({signalStrength}%) ";
    };

    pulseaudio = {
      format = "{volume}% {icon} {format_source}";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = " {icon} {format_source}";
      format-icons = {
        car = "";
        default = [ "" "" "" ];
        handsfree = "";
        headphones = "";
        headset = "";
        phone = "";
        portable = "";
      };
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      on-click = "pavucontrol";
    };
    temperature = {
      critical-threshold = 80;
      format = "{temperatureC}°C {icon}";
      format-icons = [ "" "" "" ];
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "1";
        "2" = "2";
        "3" = "3";
        "4" = "4";
        "5" = "5";
        urgent = "";
        active = "";
        default = "";
      };
      sort-by-number = true;
    };
  }];
}
