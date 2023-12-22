DOTFILES=${HOME}/.dotfiles
ZSH=${HOME}/.oh-my-zsh
ZSH_CUSTOM=${ZSH}/custom

cmus:
	if test -d '${HOME}/.config/cmus' ; then mv -f ~/.config/cmus ~/.config/cmus.bak; fi
	ln -s ${DOTFILES}/config/cmus ~/.config/cmus

conky:
	if test -d '${HOME}/.config/conky' ; then mv -f ~/.config/conky ~/.config/conky.bak; fi
	ln -s ${DOTFILES}/config/conky ~/.config/conky

dunst:
	if test -d '${HOME}/.config/dunst' ; then mv -f ~/.config/dunst ~/.config/dunst.bak; fi
	ln -s ${DOTFILES}/config/dunst ~/.config/dunst

i3:
	if test -d '${HOME}/.config/i3' ; then mv -f ~/.config/i3 ~/.config/i3.bak; fi
	ln -s ${DOTFILES}/config/i3 ~/.config/i3
	if test -d '${HOME}/.config/i3blocks' ; then mv -f ~/.config/i3blocks ~/.config/i3blocks.bak; fi
	ln -s ${DOTFILES}/config/i3blocks ~/.config/i3blocks
	git clone https://github.com/vivien/i3blocks-contrib.git --depth 1 ~/.config/i3blocks/blocks

kitty:
	if test -d '${HOME}/.config/kitty' ; then mv -f ~/.config/kitty ~/.config/kitty.bak; fi
	ln -s ${DOTFILES}/config/kitty ~/.config/kitty

neofetch:
	if test -d '${HOME}/.config/neofetch' ; then mv -f ~/.config/neofetch ~/.config/neofetch.bak; fi
	ln -s ${DOTFILES}/config/neofetch ~/.config/neofetch

nvim:
	if test ! -d '${HOME}/.config' ; then mkdir ~/.config; fi
	if test -d '${HOME}/.config/nvim' ; then mv -f ~/.config/nvim ~/.config/nvim.bak; fi
	ln -s ${DOTFILES}/config/nvim ~/.config/nvim
	nvim +PlugInstall +qall

picom:
	if test -d '${HOME}/.config/picom' ; then mv -f ~/.config/picom ~/.config/picom.bak; fi
	ln -s ${DOTFILES}/config/picom ~/.config/picom

qtile:
	if test -d '${HOME}/.config/qtile' ; then mv -f ~/.config/qtile ~/.config/qtile.bak; fi
	ln -s ${DOTFILES}/config/qtile ~/.config/qtile

rofi:
	if test -d '${HOME}/.config/rofi' ; then mv -f ~/.config/rofi ~/.config/rofi.bak; fi
	ln -s ${DOTFILES}/config/rofi ~/.config/rofi

vifm:
	if test -d '${HOME}/.config/vifm' ; then mv -f ~/.config/vifm ~/.config/vifm.bak; fi
	ln -s ${DOTFILES}/config/vifm ~/.config/vifm

vimiv:
	if test -d '${HOME}/.config/vimiv' ; then mv -f ~/.config/vimiv ~/.config/vimiv.bak; fi
	ln -s ${DOTFILES}/config/vimiv ~/.config/vimiv

zathura:
	if test -d '${HOME}/.config/zathura' ; then mv -f ~/.config/zathura ~/.config/zathura.bak; fi
	ln -s ${DOTFILES}/config/zathura ~/.config/zathura

tmux:
	if test -d '${HOME}/.config/tmux' ; then mv -f ~/.config/tmux ~/.config/tmux.bak; fi
	ln -s ${DOTFILES}/config/tmux ~/.config/tmux

zsh:
	if test ! -d '${ZSH}' ; then git clone https://github.com/ohmyzsh/ohmyzsh.git --depth 1 ${ZSH}; fi
	if test -f '${HOME}/.zshrc' ; then mv -f ~/.zshrc ~/.zshrc.bak; fi
	if test -f '${HOME}/.p10k.zsh' ; then mv -f ~/.p10k.zsh ~/.p10k.zsh.bak; fi
	if test -f '${HOME}/.bashrc' ; then mv -f ~/.bashrc ~/.bashrc.bak; fi
	if test -f '${HOME}/.bash_profile' ; then mv -f ~/.bash_profile ~/.bash_profile.bak; fi
	ln -s ${DOTFILES}/zshrc ~/.zshrc
	ln -s ${DOTFILES}/p10k.zsh ~/.p10k.zsh
	ln -s ${DOTFILES}/bashrc ~/.bashrc
	ln -s ${DOTFILES}/bash_profile ~/.bash_profile
	if test ! -d '${ZSH_CUSTOM}/plugins/zsh-vim-mode' ; then git clone https://github.com/softmoth/zsh-vim-mode.git --depth 1 ${ZSH_CUSTOM}/plugins/zsh-vim-mode; fi
	if test ! -d '${ZSH_CUSTOM}/plugins/zsh-autosuggestions' ; then git clone https://github.com/zsh-users/zsh-autosuggestions.git --depth 1 ${ZSH_CUSTOM}/plugins/zsh-autosuggestions; fi
	if test ! -d '${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting' ; then git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --depth 1 ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting; fi
	if test -d '${HOME}/.powerlevel10k' ; then mv -f ~/.powerlevel10k ~/.powerlevel10k.bak; fi
	git clone https://github.com/romkatv/powerlevel10k.git --depth 1 ~/.powerlevel10k
	if test ! -f '${ZSH_CUSTOM}/themes/powerlevel10k.zsh-theme' ; then ln -s ~/.powerlevel10k/powerlevel10k.zsh-theme ${ZSH_CUSTOM}/themes/powerlevel10k.zsh-theme ; fi

packages:
	# sudo pacman -S --needed yay --noconfirm
	yay -S --needed $$(< pkglist-native.txt) $$(< pkglist-foreign.txt)

all: cmus conky dunst i3 kitty neofetch nvim picom qtile rofi vifm vimiv zathura zsh mason

.PHONY: all cmus conky dunst i3 kitty neofetch nvim picom qtile rofi vifm vimiv zathura zsh
