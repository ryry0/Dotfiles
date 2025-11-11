
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  eval $(keychain --eval id_ed25519)
  exec hyprland


elif [[ $(tty) = /dev/tty2 ]] ; then
	sudo setfont ter-224n
	tmux
fi
