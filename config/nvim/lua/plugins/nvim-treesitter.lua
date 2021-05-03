return function()
    require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = 'all',
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        highlight = {
            -- `false` will disable the whole extension
            enable = true,
        },
        indent = {
            enable = true,
        },
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        autotag = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['ab'] = '@block.outer',
                    ['ib'] = '@block.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['al'] = '@loop.outer',
                    ['il'] = '@loop.inner',
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                },
            },
        },
        context_comment_string = {
            enable = true,
            enable_autocmd = false,
        },
        refactor = {
            highlight_definitions = {
                enable = true,
                -- Set to false if you have an `updatetime` of ~100.
                clear_on_cursor_move = true,
            },
        },
    })
end
