local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ 'TextYankPost' }, {
    group = augroup('highlight_yank', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
    end,
})

autocmd({ 'VimEnter' }, {
    pattern = '*',
    group = augroup('titlestring', { clear = true }),
    command = "let &titlestring=fnamemodify(getcwd(), ':t')",
})
