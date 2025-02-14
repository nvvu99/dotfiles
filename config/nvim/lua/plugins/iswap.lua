return function()
    require('iswap').setup({
        -- The keys that will be used as a selection, in order
        -- ('asdfghjklqwertyuiopzxcvbnm' by default)
        keys = 'qwertyuiop',

        -- Grey out the rest of the text when making a selection
        -- (enabled by default)
        grey = 'disable',

        -- Highlight group for the sniping value (asdf etc.)
        -- default 'Search'
        hl_snipe = 'ErrorMsg',

        -- Highlight group for the visual selection of terms
        -- default 'Visual'
        hl_selection = 'WarningMsg',

        -- Highlight group for the greyed background
        -- default 'Comment'
        hl_grey = 'LineNr',

        -- Post-operation flashing highlight style,
        -- either 'simultaneous' or 'sequential', or nil to disable
        -- default 'sequential'
        flash_style = 'sequential',

        -- Highlight group for flashing highlight afterward
        -- default 'IncSearch'
        hl_flash = 'ModeMsg',

        -- Automatically swap with only two arguments
        -- default nil
        autoswap = true,

        -- Other default options you probably should not change:
        debug = nil,
        hl_grey_priority = '1000',
    })
end
