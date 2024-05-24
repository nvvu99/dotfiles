return function()
    require('penvim').setup({
        rooter = {
            enable = true, -- enable/disable rooter
            patterns = { '.git' },
        },
    })
end
