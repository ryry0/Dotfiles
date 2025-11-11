link:
	ln -sf $PWD/zsh/.zshrc ~/.zshrc
	ln -sf $PWD/git/.gitconfig ~/.gitconfig
	ln -sf $PWD/nvim ~/.config/nvim
	ln -sf $PWD/nu/config.nu ~/.config/nushell/config.nu

keyd:
	cp $PWD/keyd/default.conf /etc/keyd/default.conf
