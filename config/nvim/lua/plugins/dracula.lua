local colors = {
    bg = '#282A36',
    fg = '#F8F8F2',
    selection = '#44475A',
    comment = '#6272A4',
    red = '#FF5555',
    orange = '#FFB86C',
    yellow = '#F1FA8C',
    green = '#50fa7b',
    purple = '#BD93F9',
    cyan = '#8BE9FD',
    pink = '#FF79C6',
    bright_red = '#FF6E6E',
    bright_green = '#69FF94',
    bright_yellow = '#FFFFA5',
    bright_blue = '#D6ACFF',
    bright_magenta = '#FF92DF',
    bright_cyan = '#A4FFFF',
    bright_white = '#FFFFFF',
    menu = '#21222C',
    visual = '#3E4452',
    gutter_fg = '#4B5263',
    nontext = '#3B4048',
    white = '#F8F8F2',
    black = '#191A21',
}

return {
    'Mofiqul/dracula.nvim',
    opts = {
        -- customize dracula color palette
        colors = colors,
        -- show the '~' characters after the end of buffers
        show_end_of_buffer = true, -- default false
        -- use transparent background
        transparent_bg = true, -- default false
        -- set custom lualine background color
        lualine_bg_color = '#44475a', -- default nil
        -- set italic comment
        italic_comment = true, -- default false
        -- overrides the default highlights see `:h synIDattr`
        overrides = {
            -- Examples
            -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
            -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
            -- Nothing = {} -- clear highlight of Nothing
            WinSeparator = { fg = colors.purple },
            FoldColumn = { fg = colors.gutter_fg },
            IblScope = { fg = colors.pink, nocombine = true },
            Folded = { bg = colors.gutter_fg },
            Search = { fg = colors.orange, bg = colors.comment },
            IncSearch = { fg = colors.black, bg = colors.orange },
            VirtColumn = { fg = colors.selection },
            MiniHipatternsFixme = { bg = colors.red, fg = colors.black },
            MiniHipatternsHack = { bg = colors.orange, fg = colors.black },
            MiniHipatternsTodo = { bg = colors.cyan, fg = colors.black },
            MiniHipatternsNote = { bg = colors.green, fg = colors.black },
            RainbowDelimiterRed = { fg = colors.red },
            RainbowDelimiterYellow = { fg = colors.yellow },
            RainbowDelimiterOrange = { fg = colors.orange },
            RainbowDelimiterGreen = { fg = colors.green },
            RainbowDelimiterViolet = { fg = colors.purple },
            RainbowDelimiterCyan = { fg = colors.cyan },
            DapUIBreakpointsCurrentLine = { fg = colors.cyan },
            GitSignsAdd = { fg = colors.green },
            GitSignsChange = { fg = colors.orange },
            GitSignsDelete = { fg = colors.red },
            GitSignsStagedAdd = { fg = colors.bright_green },
            GitSignsStagedChange = { fg = colors.bright_yellow },
            GitSignsStagedDelete = { fg = colors.bright_red },
        },
    },
}
