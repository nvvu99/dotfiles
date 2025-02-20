return {

    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'lukas-reineke/cmp-under-comparator',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'onsails/lspkind.nvim',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        'zbirenbaum/copilot-cmp',
    },
    config = function()
        local vim_api = vim.api
        local cmp = require('cmp')
        local types = require('cmp.types')
        local lspkind = require('lspkind')
        local luasnip = require('luasnip')

        require('luasnip.loaders.from_vscode').lazy_load({
            paths = { '~/.local/share/nvim/lazy/friendly-snippets' },
        })

        require('copilot').setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
        require('copilot_cmp').setup()

        local buffer_source = {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim_api.nvim_list_bufs()
                end,
            },
        }

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim_api.nvim_win_get_cursor(0))

            return col ~= 0 and vim_api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
                ['<S-Down>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<CR>'] = cmp.mapping.confirm(),
            }),
            sources = cmp.config.sources({
                { name = 'copilot' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'nvim_lsp_signature_help' },
            }, {
                { name = 'path' },
            }, {
                buffer_source,
            }),
            sorting = {
                priority_weight = 2,
                comparators = {
                    require('copilot_cmp.comparators').prioritize,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require('cmp-under-comparator').under,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    symbol_map = {
                        Copilot = '',
                    },
                }),
                expandable_indicator = true,
                fields = { 'abbr', 'kind', 'menu' },
            },
            window = {
                completion = {
                    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                },
                documentation = {
                    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                },
            },
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                buffer_source,
            }),
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                buffer_source,
            }),
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
            }),
        })
    end,
}
