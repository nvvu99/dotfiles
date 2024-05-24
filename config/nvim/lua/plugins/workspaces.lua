return function()
    require('workspaces').setup({
        hooks = {
            open_pre = {
                function()
                    terminate_dap()
                    vim.lsp.stop_client(vim.lsp.get_clients(), true)
                end,
            },
            open = {
                function()
                    local cwd = vim.fn.getcwd()
                    vim.o.titlestring = vim.fn.fnamemodify(cwd, ':t')
                    require('dap.ext.vscode').load_launchjs(cwd .. '/.vscode/launch.json')
                    require('neoconf.plugins.lspconfig').on_update(vim.fn.fnamemodify(cwd, ':p'))
                    require('nvim-tree.api').tree.change_root(cwd)
                    vim.cmd('LspStart')
                end,
            },
        },
    })
end
