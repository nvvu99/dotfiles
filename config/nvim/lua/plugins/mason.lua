local installed_lsp_servers = {
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
    'lua_ls',
    'marksman',
    'perlnavigator',
    'phpactor',
    'pyright',
    'vtsls',
    'volar',
    'yamlls',
    'gopls',
    'nginx_language_server',
}

local function attach_navic(client, bufnr)
    local excluded_client_names = { 'phpactor' }
    if
        client.server_capabilities['documentSymbolProvider']
        and not vim.tbl_contains(excluded_client_names, client.name)
    then
        require('nvim-navic').attach(client, bufnr)
    end
end

local default_lsp_settings = {
    capabilities = {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            },
        },
    },
    on_attach = attach_navic,
}

local function handle_setup_lsp(server_name)
    local lspconfig = require('lspconfig')
    local server_settings = require('lsp_settings')[server_name] or {}

    lspconfig[server_name].setup(vim.tbl_extend('keep', default_lsp_settings, server_settings))
end

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
        require('neodev').setup()
        require('neoconf').setup()

        local lsp = vim.lsp
        lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
            border = 'rounded',
        })

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = installed_lsp_servers,
            automatic_installation = true,
            handlers = {
                handle_setup_lsp,
            },
        })
    end,
}
