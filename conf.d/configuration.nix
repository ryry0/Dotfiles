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

    windowManager.default = "spectrwm";
    windowManager.spectrwm = {
      enable = true;
    };

    synaptics = {
      enable = true;

      additionalOptions = ''
        MatchProduct "DLL0665:01 06CB:76AD UNKNOWN"
        Driver "libinput"
        Option  "Tapping" "on"
        Option  "AccelSpeed"  "1"
        '';
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
