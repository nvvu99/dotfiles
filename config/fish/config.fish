fish_config theme choose "Dracula Official"
# source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
function fish_user_key_bindings
    fish_vi_key_bindings

    # Bind 'jj' in insert mode to switch to normal (default) mode
    # bind -M insert jj force-repaint erase-input repaint
    # bind -M insert jj "command -f repaint"
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

    # Custom Normal Mode bindings (using -M default)
    bind -M default \cl clear-screen          # Ctrl+L clears the screen
    bind -M default dd kill-whole-line        # dd deletes the whole line
end
