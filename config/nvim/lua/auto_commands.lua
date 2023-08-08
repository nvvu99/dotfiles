local vim = vim
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local format = augroup('format', {})
autocmd({ 'BufWritePost' }, {
    group = format,
    pattern = '*',
    command = 'FormatWrite',
})

local dap = augroup('dap', {})
autocmd({ 'VimEnter' }, {
    group = dap,
    pattern = '*',
    callback = function()
        require('dap.ext.vscode').load_launchjs(vim.fn.getcwd() .. '/.vscode/launch.json')
    end,
})

local highlight_yank = augroup('highlight_yank', {})
autocmd({ 'TextYankPost' }, {
    group = highlight_yank,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
    end,
})

local toggle_term = augroup('toggle_term', {})
autocmd({ 'TermOpen' }, {
    group = toggle_term,
    pattern = 'term://*',
    callback = set_terminal_keymaps,
})

local titlestring = augroup('titlestring', { clear = true })
autocmd('VimEnter', {
    pattern = '*',
    group = titlestring,
    command = "let &titlestring=fnamemodify(getcwd(), ':t')",
})

local barbecue_updater = augroup('barbecue.updater', {})
autocmd({
    'WinResized',
    'BufWinEnter',
    'CursorHold',
    'InsertLeave',
    'BufModifiedSet',
}, {
    group = barbecue_updater,
    callback = function()
        require('barbecue.ui').update()
    end,
})
