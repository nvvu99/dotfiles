return function()
    require('workspaces').setup({
        hooks = {
            open_pre = {
                'lua terminate_dap()',
                'SessionSave',
                'silent %bdelete!',
            },
            open = {
                'SessionRestore',
                "let &titlestring=fnamemodify(getcwd(), ':t')",
                function()
                    local cwd = vim.fn.getcwd()
                    require('dap.ext.vscode').load_launchjs(cwd .. '/.vscode/launch.json')
                    require('neoconf.plugins').fire('on_update', vim.fn.fnamemodify(cwd, ':p'))
                    require('nvim-tree.api').tree.change_root(cwd)
                end,
                'LspRestart',
            },
        },
    })
end
