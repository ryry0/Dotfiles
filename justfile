# install yay in $PWD/build
# cardamom chai git clone in /build when mature, then link
# use nohup to start something that won's stop

[default]
list:
	just -l

[group('install')]
inst-arch:
	sudo pacman -S --needed - < $PWD/arch/pkglist.txt
	# install yay

[group('install')]
upd-arch:
	sudo pacman -Qqe > $PWD/arch/pkglist.txt
	git add $PWD/arch/pkglist.txt
	git commit -m "chore: updated arch pkglist."

[group('link')]
link-zshrc:
	ln -sf $PWD/zsh/.zshrc ~/.zshrc

[group('link')]
link-git:
	ln -sf $PWD/git/.gitconfig ~/.gitconfig

[group('link')]
link-nvim:
	ln -sf $PWD/nvim ~/.config/nvim

[group('link')]
link-nu:
	ln -sf $PWD/nu/config.nu ~/.config/nushell/config.nu

[group('link')]
link-hypr:
	ln -sf $PWD/hypr ~/.config/hypr

[group('link')]
link-foot:
	ln -sf $PWD/foot ~/.config/foot

[group('link')]
link-wofi:
	ln -sf $PWD/wofi ~/.config/wofi

[group('link')]
link-waybar:
	ln -sf $PWD/waybar ~/.config/waybar

[group('link')]
link-dunst:
	mkdir -p ~/.config/dunst
	ln -sf $PWD/dunst/dunstrc ~/.config/dunst/dunstrc

[group('link')]
link-tmux:
	ln -sf $PWD/tmux/.tmux.conf ~/.tmux.conf

[group('link')]
link-wlogout:
	ln -sf $PWD/wlogout ~/.config/wlogout

# link dotfiles
[group('link')]
link: link-zshrc link-git link-nvim link-nu link-hypr link-foot link-wofi link-waybar link-dunst link-tmux link-wlogout

[group('install')]
keyd:
	sudo cp $PWD/keyd/default.conf /etc/keyd/default.conf

[group('install')]
ff-ultima:
	bash <(curl -s https://raw.githubusercontent.com/soulhotel/git-userChrome/main/scripts/gituserChrome.sh)

[group('edit')]
hypr:
	nvim $PWD/hypr/hyprland.conf

alias nvim := vimrc

[group('edit')]
vimrc:
	nvim $PWD/nvim/init.lua

[group('edit')]
nu:
	nvim $PWD/nu/config.nu

[group('edit')]
just:
	nvim $PWD/justfile

[group('edit')]
waybar:
	nvim -c "setf json" $PWD/waybar/config

[group('edit')]
tmux:
	nvim $PWD/tmux/.tmux.conf
