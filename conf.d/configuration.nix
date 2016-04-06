# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

# Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

# kernel configs
  boot.blacklistedKernelModules = [ "psmouse" ];
  boot.extraKernelParams = [ "quiet" ];

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
    networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.enableB43Firmware = true;

# Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

# Set your time zone.
  time.timeZone = "America/New_York";

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [

    ## system utils
    htop
    tlp
    p7zip
    bc
    acpi
    pciutils
    usbutils
    lsof

    ## programming utils
    git
    vim
    tmux

    ## C
    gcc
    cmake
    gnumake
    gdb
    strace
    ctags
    valgrind

    ## uC utils
    avrgcclibc
    avrdude
    gcc-arm-embedded

    ## scientific computing
    julia
    texlive.combined.scheme-minimal

    ## X programs
    google-chrome
    rxvt_unicode
    xorg.xbacklight
    xclip
    xorg.xkbcomp
    xdotool

    ## ricing
    unclutter
    compton
    redshift
    feh

    ## other
    syncthing
    mplayer
  ];

# List services that you want to enable:

# Enable CUPS to print documents.
  services.printing.enable = true;

# Configure TLP
  services.tlp.enable = true;
  services.tlp.extraConfig = ''
  CPU_SCALING_GOVERNOR_ON_AC=performance
  CPU_SCALING_GOVERNOR_ON_BAT=ondemand
  SCHED_POWERSAVE_ON_AC=0
  SCHED_POWERSAVE_ON_BAT=1
  ENERGY_PERF_POLICY_ON_AC=performance
  ENERGY_PERF_POLICY_ON_BAT=powersave
  PCIE_ASPM_ON_AC=performance
  PCIE_ASPM_ON_BAT=powersave
  WIFI_PWR_ON_AC=1
  WIFI_PWR_ON_BAT=5
  RUNTIME_PM_ON_AC=on
  RUNTIME_PM_ON_BAT=auto
  USB_AUTOSUSPEND=1
  USB_BLACKLIST_WWAN=1
  DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"
  '';

# Enable zsh
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

# Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "intel" ];

    displayManager.slim.enable = true;

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    windowManager.default = "bspwm";
    windowManager.bspwm = {
      enable = true;
    };

    synaptics = {
      enable = true;
      tapButtons = true;
      fingersMap = [1 3 2];
      horizTwoFingerScroll = true;
      vertTwoFingerScroll = true;
      scrollDelta = -72;
      palmDetect = true;
      palmMinWidth = 11;
      palmMinZ = 100;

      additionalOptions = ''
        Option  "AccelSpeed"  "1"
        '';

        #MatchProduct "DLL0665:01 06CB:76AD UNKNOWN"
        #Driver "libinput"
        #Option  "Tapping" "on"
        #Option "VertTwoFingerScroll" "on"
        #Option "HorizTwoFingerScroll" "on"
        #Option "VertScrollDelta" "-128"
        #Option "HorizScrollDelta" "-128"
    };
  };


  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
        terminus_font
        inconsolata
        source-code-pro
        unifont
    ];
  };

# services.xserver.xkbOptions = "eurosign:e";

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.ryan = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    createHome = true;
    home = "/home/ryan";
    uid = 1000;
  };

# The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";
}
