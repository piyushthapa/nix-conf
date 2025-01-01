{
  enable = true;
  systemd.enable = true;
  style = ''
    ${builtins.readFile ./waybar.css}
  '';
  settings = [{
    layer = "top";
    position = "top";
    tray = { spacing = 10; };

    modules-left = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right =
      [ "pulseaudio" "network" "cpu" "temperature" "battery" "tray" ];

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

    "clock" = {
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>'';
      format = "{:%a; %d %b, %I:%M %p}";
    };

    cpu = {
      format = "{usage}% ";
      tooltip = false;
    };

    network = {
      interval = 1;
      format-alt = "{ifname}= {ipaddr}/{cidr}";
      format-disconnected = "Disconnected ⚠";
      format-ethernet =
        "{ifname}= {ipaddr}/{cidr}   up= {bandwidthUpBits} down= {bandwidthDownBits}";
      format-linked = "{ifname} (No IP) ";
      format-wifi = "{essid} ({signalStrength}%) ";
    };

    "pulseaudio" = {
      # scroll-step = 1; # %, can be a float
      reverse-scrolling = 1;
      format = "{volume}% {icon}  {format_source} ";
      format-bluetooth = "{volume}% {icon} {format_source} ";
      format-bluetooth-muted = " {icon} {format_source} ";
      format-muted = " {format_source} ";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [ "" "" "" ];
      };
      on-click = "pavucontrol";
      min-length = 13;
    };

    "temperature" = {
      # thermal-zone = 2;
      # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
      critical-threshold = 80;
      # format-critical = "{temperatureC}°C {icon}";
      format = "{temperatureC}°C {icon}";
      format-icons = [ "" "" "" "" "" ];
      tooltip = false;
    };
  }];
}
