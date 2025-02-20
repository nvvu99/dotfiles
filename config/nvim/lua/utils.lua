local function map_buffer(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true, buffer = true })
end

local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

return {
    map = map,
    nmap = function(shortcut, command)
        map('n', shortcut, command)
    end,
    imap = function(shortcut, command)
        map('i', shortcut, command)
    end,
    tmap = function(shortcut, command)
        map('t', shortcut, command)
    end,

    map_buffer = map_buffer,
    nmap_buffer = function(shortcut, command)
        map_buffer('n', shortcut, command)
    end,
    imap_buffer = function(shortcut, command)
        map_buffer('i', shortcut, command)
    end,
    tmap_buffer = function(shortcut, command)
        map_buffer('t', shortcut, command)
    end,
}
