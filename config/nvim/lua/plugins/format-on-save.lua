return function()
    local format_on_save = require('format-on-save')
    local formatters = require('format-on-save.formatters')

    format_on_save.setup({
        exclude_path_patterns = {
            'node_modules',
            'vendor',
            '.local/share/nvim/lazy',
        },
        formatter_by_ft = {
            css = formatters.prettierd,
            scss = formatters.prettierd,
            html = formatters.prettierd,
            javascript = formatters.prettierd,
            javascriptreact = formatters.prettierd,
            typescript = formatters.prettierd,
            typescriptreact = formatters.prettierd,
            yaml = formatters.prettierd,
            json = formatters.prettierd,
            markdown = formatters.prettierd,
            lua = formatters.stylua,
            openscad = formatters.lsp,
            python = formatters.black,
            sh = formatters.shfmt,
        },

        fallback_formatter = {
            formatters.remove_trailing_whitespace,
            formatters.lsp,
        },
    })
end
