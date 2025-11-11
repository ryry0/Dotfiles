arch:
	sudo pacman -S --needed - < $PWD/arch/pkglist.txt

# dotfiles to link
zshrc:
	ln -sf $PWD/zsh/.zshrc ~/.zshrc

git:
	ln -sf $PWD/git/.gitconfig ~/.gitconfig

nvim:
	ln -sf $PWD/nvim ~/.config/nvim

nu:
	ln -sf $PWD/nu/config.nu ~/.config/nushell/config.nu

hypr:
	ln -sf $PWD/hypr ~/.config/hypr

foot:
	ln -sf $PWD/foot ~/.config/foot

wofi:
	ln -sf $PWD/wofi ~/.config/wofi

waybar:
	ln -sf $PWD/waybar ~/.config/waybar

link: zshrc git nvim nu hypr foot wofi waybar

keyd:
	cp $PWD/keyd/default.conf /etc/keyd/default.conf

ff-ultima:
	bash <(curl -s https://raw.githubusercontent.com/soulhotel/git-userChrome/main/scripts/gituserChrome.sh)
