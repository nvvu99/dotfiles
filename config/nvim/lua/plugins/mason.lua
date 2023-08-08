return function()
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
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_client_attach,
                })
            end,
            ['emmet_language_server'] = function()
                lspconfig.emmet_language_server.setup({
                    capabilities = capabilities,
                    on_attach = on_client_attach,
                    filetypes = {
                        'astro',
                        'eruby',
                        'html',
                        'htmldjango',
                        'javascriptreact',
                        'typescriptreact',
                        'css',
                        'less',
                        'sass',
                        'scss',
                        'svelte',
                        'pug',
                        'vue',
                        'php',
                        'blade',
                    },
                })
            end,
            ['jsonls'] = function()
                lspconfig.jsonls.setup({
                    capabilities = capabilities,
                    on_attach = on_client_attach,
                    settings = {
                        json = {
                            schemas = require('schemastore').json.schemas(),
                            validate = { enable = true },
                        },
                    },
                })
            end,
        },
    })
end
