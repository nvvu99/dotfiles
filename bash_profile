#
# ~/.bash_profile
#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Append "$1" to $PATH when not already in.
prepend_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1:${PATH:+$PATH}"
    esac
}

prepend_path "$HOME/.local/bin"
prepend_path "$HOME/.bin"
prepend_path "$HOME/go/bin"
prepend_path "$HOME/.config/composer/vendor/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export MANPAGER="nvim +Man!"


export GUI_EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/kitty
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export GLFW_IM_MODULE=ibus
export GTK_IM_MODULE=ibus

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4 --layout=default --info inline --bind ctrl-a:select-all,ctrl-d:deselect-all,tab:up,shift-tab:down,alt-f:toggle,ctrl-p:toggle-preview'
export FZF_DEFAULT_COMMAND='ag -g "" --hidden'

export RIPGREP_CONFIG_PATH=~/.ripgreprc

export SHELL=/usr/bin/zsh
. "$HOME/.cargo/env"
