arch:

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

link: zshrc git nvim nu hypr foot wofi

keyd:
	cp $PWD/keyd/default.conf /etc/keyd/default.conf
