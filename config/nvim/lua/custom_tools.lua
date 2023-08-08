function map_buffer(mode, shortcut, command)
    vim.api.nvim_buf_set_keymap(0, mode, shortcut, command, { noremap = true, silent = true })
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
    require('dapui').close()
    require('dap').terminate({}, { terminateDebuggee = true })
end

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, count = 98 })
local lazydocker = Terminal:new({ cmd = 'lazydocker', hidden = true, count = 99 })

function toggle_lazygit()
    lazygit:toggle()
end

function toggle_lazydocker()
    if vim.g.docker_compose_folder then
        lazydocker.cmd = 'cd ' .. vim.g.docker_compose_folder .. ' && lazydocker'
    end
    lazydocker:toggle()
end
