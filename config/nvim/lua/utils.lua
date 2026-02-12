local function map_buffer(mode, shortcut, command, options)
    options = vim.tbl_deep_extend('force', { noremap = true, silent = true, buffer = true }, options or {})
    vim.keymap.set(mode, shortcut, command, options)
end

local function map(mode, shortcut, command, options)
    options = vim.tbl_deep_extend('force', { noremap = true, silent = true }, options or {})
    vim.keymap.set(mode, shortcut, command, options)
end

return {
    map = map,
    nmap = function(shortcut, command, options)
        map('n', shortcut, command, options)
    end,
    imap = function(shortcut, command, options)
        map('i', shortcut, command, options)
    end,
    tmap = function(shortcut, command, options)
        map('t', shortcut, command, options)
    end,

    map_buffer = map_buffer,
    nmap_buffer = function(shortcut, command, options)
        map_buffer('n', shortcut, command, options)
    end,
    imap_buffer = function(shortcut, command, options)
        map_buffer('i', shortcut, command, options)
    end,
    tmap_buffer = function(shortcut, command, options)
        map_buffer('t', shortcut, command, options)
    end,
    diagnostic_hover = function()
        require('eagle.keyboard_handler').render_keyboard_mode()
    end,
}
