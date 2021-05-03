return function()
    require('mini.comment').setup({
        hooks = {
            pre = function()
                require('ts_context_commentstring.internal').update_commentstring()
            end,
        },
    })

    require('mini.doc').setup({})

    require('mini.sessions').setup({
        autoread = true,
        file = '.session.vim',
    })

    require('mini.starter').setup({})

    require('mini.surround').setup({})

    require('mini.trailspace').setup({})
end
