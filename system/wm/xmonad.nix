{config, lib, pkgs, ...}:

# XMonad configuration
{

  services = {
    gnome = {
      gnome-keyring.enable = true; 
    };

    upower.enable = true;

    dbus = {
      enable = true;
      # socketActivated = true;
      packages = [ pkgs.gnome3.dconf ];
    };

    xserver= {
      enable = true;
      #startDbusSession = true;
      layout = "us";

      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
        };
      };

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      displayManager = {
        defaultSession = "none+xmonad";
      };
    };

    #hardware.bluetooth = {
    #  enable = true;
    #  hsphfpd.enable = true;
    #  settings = {
    #    General = {
    #      Enable = "Source,Sink,Media,Socket";
    #    };
    #  };
    #};

  };

    services.blueman.enable = true;
    # xkbOptions = "caps:ctrl_modifier";
    systemd.services.upower.enable = true;
}
