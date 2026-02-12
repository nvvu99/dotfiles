return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'fdschmidt93/telescope-egrepify.nvim' },
    },
    tag = 'v0.1.9',
    opts = {
        defaults = {
            sorting_strategy = 'ascending',
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                    preview_width = 0.5,
                },
            },
            mappings = {
                i = {
                    ['<Esc>'] = 'close',
                    ['<Tab>'] = 'move_selection_next',
                    ['<S-Tab>'] = 'move_selection_previous',
                    ['<C-h>'] = 'preview_scrolling_left',
                    ['<C-j>'] = 'preview_scrolling_down',
                    ['<C-k>'] = 'preview_scrolling_up',
                    ['<C-l>'] = 'preview_scrolling_right',
                    ['<C-s>'] = 'select_horizontal',
                },
                n = {
                    ['<Tab>'] = 'move_selection_next',
                    ['<S-Tab>'] = 'move_selection_previous',
                    ['<C-h>'] = 'preview_scrolling_left',
                    ['<C-j>'] = 'preview_scrolling_down',
                    ['<C-k>'] = 'preview_scrolling_up',
                    ['<C-l>'] = 'preview_scrolling_right',
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

        local builtin = require('telescope.builtin')
        local extensions = telescope.extensions
        local nmap = require('utils').nmap
        nmap('<Leader>n', builtin.find_files, { desc = 'Telescope: Find Files' })
        nmap('<Leader>f', extensions.egrepify.egrepify, { desc = 'Telescope: Egrepify' })
        nmap('<Leader>b', builtin.buffers, { desc = 'Telescope: Buffers' })
        nmap('<Leader>c', builtin.git_bcommits, { desc = 'Telescope: Git Commits' })
        nmap('gd', builtin.lsp_definitions, { desc = 'Telescope: LSP Definitions' })
        nmap('gt', builtin.lsp_type_definitions, { desc = 'Telescope: LSP Type Definitions' })
        nmap('gi', builtin.lsp_implementations, { desc = 'Telescope: LSP Implementations' })
        nmap('gr', builtin.lsp_references, { desc = 'Telescope: LSP References' })
    end,
}
