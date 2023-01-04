local wezterm = require('wezterm')
local action = wezterm.action

return {
    font = wezterm.font('Fira Code Retina'),
    color_scheme = 'Dracula (Official)',

    window_decorations = 'RESIZE',
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    keys = {
        {
            key = 't',
            mods = 'ALT|SHIFT',
            action = action.SpawnTab('CurrentPaneDomain', { cwd = '~' }),
        },
        {
            key = 'w',
            mods = 'ALT|SHIFT',
            action = action.CloseCurrentTab({ confirm = true }),
        },
        {
            key = 'h',
            mods = 'ALT|SHIFT',
            action = action.ActivateTabRelative(-1),
        },
        {
            key = 'l',
            mods = 'ALT|SHIFT',
            action = action.ActivateTabRelative(1),
        },
        {
            key = 'LeftArrow',
            mods = 'ALT|SHIFT',
            action = action.MoveTabRelative(-1),
        },
        {
            key = 'RightArrow',
            mods = 'ALT|SHIFT',
            action = action.MoveTabRelative(1),
        },
        {
            key = 'F11',
            mods = 'NONE',
            action = action.ToggleFullScreen,
        },
    },

    colors = {
        tab_bar = {
            background = '#282A36',

            active_tab = {
                bg_color = '#BD93F9',
                fg_color = '#282A36',
                intensity = 'Normal',
                underline = 'None',
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = '#44475A',
                fg_color = '#F8F8F2',
            },

            inactive_tab_hover = {
                bg_color = '#44475A',
                fg_color = '#F8F8F2',
                italic = true,
            },

            new_tab = {
                bg_color = '#44475A',
                fg_color = '#F8F8F2',
            },

            new_tab_hover = {
                bg_color = '#44475A',
                fg_color = '#F8F8F2',
                italic = true,
            },
        },
    },
}
