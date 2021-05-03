return function()
    require('neoscroll').setup({})

    local mappings = {
        ['<C-s>'] = { 'scroll', { '-0.20', 'false', '50' } },
        ['<C-a>'] = { 'scroll', { '0.20', 'false', '50' } },
        ["'"] = { 'scroll', { '-0.20', 'false', '50' } },
        ['<Cr>'] = { 'scroll', { '0.20', 'false', '50' } },
    }

    require('neoscroll.config').set_mappings(mappings)
end
