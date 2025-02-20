return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = {
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
    },
    config = function(_, opts)
        local telescope = require('telescope')

        telescope.setup(opts)

        telescope.load_extension('egrepify')
        telescope.load_extension('fzf')
        telescope.load_extension('workspaces')

        local builtin = require('telescope.builtin')
        local extensions = telescope.extensions
        local nmap = require('utils').nmap
        nmap('<Leader>n', builtin.find_files)
        nmap('<Leader>f', extensions.egrepify.egrepify)
        nmap('<Leader>b', builtin.buffers)
        nmap('<Leader>c', builtin.git_bcommits)
        nmap('<Leader>w', extensions.workspaces.workspaces)
        nmap('gd', builtin.lsp_definitions)
        nmap('gt', builtin.lsp_type_definitions)
        nmap('gi', builtin.lsp_implementations)
        nmap('gr', builtin.lsp_references)
    end,
}
