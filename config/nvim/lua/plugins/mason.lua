return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'b0o/schemastore.nvim',
        'folke/neodev.nvim',
        'folke/neoconf.nvim',
    },
    cond = function()
        return vim.fn.glob('.project') ~= ''
    end,
    config = function()
        require('neodev').setup({
            override = function(root_dir, library)
                if root_dir:find('dotfiles', 1, true) == 1 then
                    library.enabled = true
                    library.plugins = true
                end
            end,
        })
        require('neoconf').setup()

        local lspconfig = require('lspconfig')
        local lsp = vim.lsp
        lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
            border = 'rounded',
        })
        local capabilities = lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        local function on_client_attach(client, bufnr)
            if client.server_capabilities['documentSymbolProvider'] then
                require('nvim-navic').attach(client, bufnr)
            end
        end

        local default_lsp_settings = {
            capabilities = capabilities,
            on_attach = on_client_attach,
        }

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'bashls',
                'clangd',
                'cssls',
                'cssmodules_ls',
                'dockerls',
                'emmet_language_server',
                'grammarly',
                'html',
                'intelephense',
                'jsonls',
                'marksman',
                'pyright',
                'lua_ls',
                'vtsls',
                'volar',
                'yamlls',
                'gopls',
                'perlnavigator',
            },
            automatic_installation = true,
            ui = {
                icons = {
                    server_installed = '✓',
                    server_pending = '➜',
                    server_uninstalled = '✗',
                },
            },
            handlers = {
                function(server_name)
                    local server_settings = require('lsp_settings')[server_name] or {}

                    lspconfig[server_name].setup(vim.tbl_extend('force', default_lsp_settings, server_settings))
                end,
            },
        })
    end,
}
