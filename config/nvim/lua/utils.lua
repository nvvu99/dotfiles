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

function merge_tables(t1, t2)
    t1 = t1 or {}
    t2 = t2 or {}

    for key, value in pairs(t2) do
        t1[key] = value
    end

    return t1
end
