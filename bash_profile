#
# ~/.bash_profile
#

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
