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
    'basedpyright',
    'vtsls',
    'vue_ls',
    'yamlls',
    'gopls',
    'laravel_ls',
}

local function on_lsp_attach(client, bufnr)
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
    on_attach = on_lsp_attach,
}

local function handle_setup_lsp(server_name)
    local server_settings = require('lsp_settings')[server_name] or {}

    vim.lsp.config(server_name, vim.tbl_extend('keep', default_lsp_settings, server_settings))
end

return {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
        'mason-org/mason.nvim',
        'neovim/nvim-lspconfig',
        'b0o/schemastore.nvim',
        { 'folke/lazydev.nvim', ft = 'lua' },
        'folke/neoconf.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    cond = function()
        return vim.fn.glob('.project') ~= ''
    end,
    config = function()
        require('lazydev').setup({})
        require('neoconf').setup()

        require('mason-tool-installer').setup({
            ensure_installed = vim.tbl_extend('keep', {
                'blade-formatter',
                'js-debug-adapter',
                'php-debug-adapter',
                'prettier',
                'stylua',
            }, installed_lsp_servers),
        })

        require('mason').setup()
        require('mason-lspconfig').setup({
            handlers = {
                handle_setup_lsp,
            },
            automatic_enable = true,
        })
    end,
}
