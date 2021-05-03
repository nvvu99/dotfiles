return function()
    local util = require('lspconfig.util')

    local language_servers = {
        'bashls',
        'clangd',
        'cssls',
        'cssmodules_ls',
        'dockerls',
        'emmet_ls',
        'grammarly',
        'html',
        'intelephense',
        'jsonls',
        'marksman',
        'pyright',
        'sumneko_lua',
        'tsserver',
        'volar',
        'yamlls',
    }

    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = language_servers,
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
            icons = {
                server_installed = '✓',
                server_pending = '➜',
                server_uninstalled = '✗',
            },
        },
    })

    local lsp = vim.lsp
    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = 'rounded',
    })

    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    local lspconfig = require('lspconfig')
    for _, ls in ipairs(language_servers) do
        lspconfig[ls].setup({
            capabilities = capabilities,
        })
    end
    lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
            'html',
            'typescriptreact',
            'javascriptreact',
            'css',
            'sass',
            'scss',
            'less',
            'vue',
        },
    })
    lspconfig.intelephense.setup({
        capabilities = capabilities,
        root_dir = function(pattern)
            local cwd = vim.loop.cwd()
            local root = util.root_pattern('composer.json', '.git', '.hg')(pattern)

            -- prefer cwd if root is a descendant
            return util.path.is_descendant(cwd, root) and cwd or root
        end,
    })
end
