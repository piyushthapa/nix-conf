# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  #boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_1.override {
  #  argsOverride = rec {
  #    src = pkgs.fetchurl {
  #      url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
  #      sha256 = "sha256-Vo7KrruLh8fIJGu6Z7yDQClyvzT1gRZRotPNVI/3tnE=";
  #    };
  #    version = "6.1.80";
  #    modDirVersion = "6.1.80";
  #  };
  #});
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "piyush" ];

  };

  # links /libexec from derivations to /run/current-system/sw
  environment.pathsToLink = [ "/libexec" ];


  # Virtual machines
  #virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = [ "piyush" ];
  #virtualisation.virtualbox.host.enableExtensionPack = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  ## Enable hyperland
  #programs.hyprland = {
  #  enable = true;
  #  # set the flake package
  #  package =
  #    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  #  # make sure to also set the portal package, so that they are in sync
  #  portalPackage =
  #    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  #};


  services.xserver.deviceSection = ''Option "TearFree" "true"''; # For amdgpu.


  services.displayManager = {
    defaultSession = "none+i3";
  };
  services.xserver = {
    enable = true;
    enableTearFree = true;
    enableCtrlAltBackspace = true;

    desktopManager = {
      xterm.enable = false;
    };


    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
      ];
    };
  };

  programs.dconf.enable = true;


  # setup AMD GPU
  services.xserver.videoDrivers = [ "amdgpu" ];
  # hardware.graphics.extraPackages = with pkgs; [ rocmPackages.clr.icd ];

  # Setup Trezor
  services.trezord = {
    enable = true;
  };


  #
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.splix ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
    };
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Bluetooh 
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.piyush = {
    isNormalUser = true;
    description = "piyush";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      killall
      #  thunderbird
    ];
  };
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    zsh
    nil
    nixfmt-classic
    pinentry-curses
    trezord

    wl-clipboard
    xdg-utils
    vesktop

    # i3 icon and theme support
    lxappearance
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.ssh = { startAgent = true; };

  # Fonts
  fonts.packages = with pkgs;
    [
      font-awesome
      material-icons
      (nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" "FiraMono" "JetBrainsMono" ];
      })
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  services.pcscd.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
