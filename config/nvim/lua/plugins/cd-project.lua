return function()
    require('cd-project').setup({
        hooks = {
            {
                callback = function()
                    terminate_dap()
                    -- vim.cmd('SessionSave')
                    -- vim.cmd('silent %bdelete!')
                end,
                order = 1,
            },
            {
                callback = function(dir)
                    vim.cmd('LspRestart')
                    -- vim.cmd('SessionRestore')
                    vim.cmd("let &titlestring=fnamemodify(getcwd(), ':t')")

                    require('dap.ext.vscode').load_launchjs(dir .. '/.vscode/launch.json')
                    require('neoconf.plugins').fire('on_update', vim.fn.fnamemodify(dir, ':p'))
                    require('nvim-tree.api').tree.change_root(dir)
                end,
                order = 2,
            },
        },
    })
end
