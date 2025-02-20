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
        size = 20,
        open_mapping = [[<A-\>]],
        highlights = {
            NormalFloat = {
                bg = '#282A36',
                fg = '#F8F8F2',
            },
        },
        direction = 'float',
        autochdir = true,
        float_opts = {
            border = 'curved',
            height = 47,
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

        map({ 'n', 't' }, '<Leader>g', function()
            lazygit:toggle()
        end)
        map({ 'n', 't' }, '<Leader>d', function()
            lazydocker:toggle()
        end)
    end,
}
