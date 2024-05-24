return function()
    local telescope = require('telescope')

    telescope.setup({
        defaults = {
            sorting_strategy = 'ascending',
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                    preview_width = 0.65,
                },
            },
            mappings = {
                i = {
                    ['<Esc>'] = 'close',
                    ['<Tab>'] = 'move_selection_next',
                    ['<S-Tab>'] = 'move_selection_previous',
                    ['<C-s>'] = 'select_horizontal',
                },
                n = {
                    ['<Tab>'] = 'move_selection_next',
                    ['<S-Tab>'] = 'move_selection_previous',
                    ['<C-s>'] = 'select_horizontal',
                    v = 'toggle_selection',
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
        },
    })

    telescope.load_extension('egrepify')
    telescope.load_extension('fzf')
    telescope.load_extension('workspaces')
end
