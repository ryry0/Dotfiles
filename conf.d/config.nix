{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
            ## system utils
            htop
            tlp
            p7zip
            bc
            acpi
            pciutils
            usbutils
            strace
            ltrace
            dstat
            lsof
            colordiff

            ## programming utils
            git
            vim
            tmux

            ## c utils
            gcc
            cmake
            gnumake
            gdb
            ctags
            valgrind
            cmocka

            ## c libs
            ncurses
            x11
            mesa

            ## uC utils
            avrgcclibc
            avrdude
            gcc-arm-embedded

            ## android programming
            android-studio

            ## elm
            elm

            ## rust
            rustc

            ## scientific computing
            julia
            texlive.combined.scheme-full
            pandoc
            python3

            ## X programs
            google-chrome
            rxvt_unicode
            xorg.xbacklight
            xclip
            xorg.xkbcomp
            xdotool
            mupdf
            calibre
            xournal

            ## ricing
            unclutter
            compton
            redshift
            feh

            ## terminal programs
            mplayer
            rtorrent
            links2
            crawl
            mutt

      ];
    };
  };
}
  
