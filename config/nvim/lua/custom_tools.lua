function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function map_buffer(mode, shortcut, command)
    vim.api.nvim_buf_set_keymap(0, mode, shortcut, command, { noremap = true, silent = true })
end

function unmap(mode, shortcut)
    vim.api.nvim_del_keymap(mode, shortcut)
end

function unmap_buffer(mode, shortcut)
    vim.api.nvim_buf_del_keymap(0, mode, shortcut)
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

function vmap(shortcut, command)
    map('v', shortcut, command)
end

function tmap(shortcut, command)
    map('t', shortcut, command)
end

function cmap(shortcut, command)
    map('c', shortcut, command)
end

function omap(shortcut, command)
    map('o', shortcut, command)
end

function xmap(shortcut, command)
    map('x', shortcut, command)
end

function nunmap_buffer(shortcut)
    unmap_buffer('n', shortcut)
end

function nmap_buffer(shortcut, command)
    map_buffer('n', shortcut, command)
end

function tmap_buffer(shortcut, command)
    map_buffer('t', shortcut, command)
end

function set_terminal_keymaps()
    tmap_buffer('<C-h>', [[<C-\><C-n><C-W>h]])
    tmap_buffer('<C-j>', [[<C-\><C-n><C-W>j]])
    tmap_buffer('<C-k>', [[<C-\><C-n><C-W>k]])
    tmap_buffer('<C-l>', [[<C-\><C-n><C-W>l]])
end

function terminate_dap()
    require('dap').terminate({}, { terminateDebuggee = true }, function()
        require('dapui').close()
    end)
end

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, count = 98 })
local lazydocker = Terminal:new({ cmd = 'lazydocker', hidden = true, count = 99 })

function toggle_lazygit()
    lazygit:toggle()
end

function toggle_lazydocker()
    lazydocker:toggle()
end
