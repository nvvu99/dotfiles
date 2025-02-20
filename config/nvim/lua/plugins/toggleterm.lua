local tmap_buffer = require('utils').tmap_buffer
local map = require('utils').map

local function set_terminal_keymaps()
    tmap_buffer('<C-h>', [[<C-\><C-n><C-W>h]])
    tmap_buffer('<C-j>', [[<C-\><C-n><C-W>j]])
    tmap_buffer('<C-k>', [[<C-\><C-n><C-W>k]])
    tmap_buffer('<C-l>', [[<C-\><C-n><C-W>l]])
end

return {
    'akinsho/toggleterm.nvim',
    opts = {
        -- size can be a number or function which is passed the current terminal
        size = 20,
        open_mapping = [[<A-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        highlights = {
            NormalFloat = {
                bg = '#282A36',
                fg = '#F8F8F2',
            },
        },
        shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = true,
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        direction = 'float',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        autochdir = true,
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            -- The border key is *almost* the same as 'nvim_open_win'
            -- see :h nvim_open_win for details on borders however
            -- the 'curved' border is a custom border type
            -- not natively supported but implemented in this plugin.
            border = 'curved',
            height = 80,
            winblend = 0,
        },
    },
    config = function(_, opts)
        require('toggleterm').setup(opts)

        vim.api.nvim_create_autocmd({ 'TermOpen' }, {
            group = vim.api.nvim_create_augroup('toggle_term', {}),
            pattern = 'term://*',
            callback = set_terminal_keymaps,
        })

        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, count = 98 })
        local lazydocker = Terminal:new({ cmd = 'lazydocker', hidden = true, count = 99 })

        local function toggle_lazygit()
            lazygit.cmd = 'cd ' .. vim.fn.getcwd() .. ' && lazygit'
            lazygit:toggle()
        end

        local function toggle_lazydocker()
            lazydocker.cmd = 'cd ' .. vim.fn.getcwd() .. ' && lazydocker'
            lazydocker:toggle()
        end

        map({ 'n', 't' }, '<Leader>g', toggle_lazygit)
        map({ 'n', 't' }, '<Leader>d', toggle_lazydocker)
    end,
}
