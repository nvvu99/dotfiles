local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local format = augroup('format', {})
autocmd({ 'BufWritePost' }, {
    group = format,
    pattern = '*',
    callback = function()
        if vim.fn.glob('.formatignore') == '' then
            vim.cmd('FormatWrite')
        end
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
autocmd({ 'VimEnter' }, {
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

-- local unfocus = augroup('unfocus', {})
-- autocmd({ 'FocusLost' }, {
--     group = unfocus,
--     callback = function()
--         vim.lsp.stop_client(vim.lsp.get_clients(), true)
--     end,
-- })
--
-- local focus = augroup('focus', {})
-- autocmd({ 'FocusGained' }, {
--     group = focus,
--     callback = function()
--         vim.cmd('LspStart')
--     end,
-- })
