return function()
    require('neoscroll').setup({})
    local scroll = require('neoscroll').scroll
    local scroll_opts = { move_cursor = true, duration = 50 }

    local mappings = {
        ["'"] = function()
            scroll(-0.2, scroll_opts)
        end,
        ['<Cr>'] = function()
            scroll(0.2, scroll_opts)
        end,
    }

    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(mappings) do
        vim.keymap.set(modes, key, func)
    end
end
