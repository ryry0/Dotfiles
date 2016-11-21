{
  allowUnfree = true;
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
            zsh-syntax-highlighting

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
            pkgconfig
            doxygen

            ## c libs
            ncurses
            x11
            mesa

            ## uC utils
            avrdude

            ## android programming
            android-studio

            ## elm
            elmPackages.elm

            ## rust
            rustc
            cargo

            ## scientific computing
            julia
            texlive.combined.scheme-full
            pandoc
            python3

            ## X programs
            xorg.xbacklight
            xorg.xkbcomp
            xorg.libxcb
            google-chrome-dev
            rxvt_unicode
            xclip
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
  
