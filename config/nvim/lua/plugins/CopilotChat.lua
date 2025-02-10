return function()
    require('CopilotChat').setup({
        window = {
            layout = 'float',
            width = 0.8,
            height = 0.8,
            border = 'rounded',
        },
    })

    -- require('copilot').setup({
    --     suggestion = {
    --         auto_trigger = true,
    --         keymap = {
    --             next = '<M-j>',
    --             prev = '<M-k>',
    --             dismiss = '<M-u>',
    --         },
    --     },
    -- })
end
