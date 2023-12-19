return function()
    require('mini.comment').setup({
        hooks = {
            pre = function()
                require('ts_context_commentstring.internal').update_commentstring()
            end,
        },
    })

    require('mini.doc').setup({})

    require('mini.starter').setup({})

    require('mini.surround').setup({})

    require('mini.trailspace').setup({})

    require('mini.splitjoin').setup({
        mappings = {
            toggle = '<Leader>J',
        },
    })

    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
        highlighters = {
            -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
            fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
            todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })

    require('mini.align').setup()

    require('mini.ai').setup()
end
