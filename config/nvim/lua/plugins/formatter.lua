return function()
    -- Utilities for creating configurations
    local util = require('formatter.util')
    local defaults = require('formatter.defaults')
    local filetypes = require('formatter.filetypes')

    -- Provides the Format and FormatWrite commands
    require('formatter').setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
            css = filetypes.css.prettier,
            html = filetypes.html.prettier,
            javascript = filetypes.javascript.prettier,
            javascriptreact = filetypes.javascriptreact.prettier,
            json = filetypes.json.prettier,
            markdown = filetypes.markdown.prettier,
            scss = util.withl(defaults.prettier, 'scss'),
            typescript = filetypes.typescript.prettier,
            typescriptreact = filetypes.typescriptreact.prettier,
            yaml = filetypes.yaml.prettier,
            vue = filetypes.vue.prettier,
            php = filetypes.php.pint,
            python = filetypes.python.black,
            lua = filetypes.lua.stylua,
            -- Use the special "*" filetype for defining formatter configurations on any filetype
            ['*'] = {
                -- "formatter.filetypes.any" defines default configurations for any filetype
                require('formatter.filetypes.any').remove_trailing_whitespace,
            },
        },
    })
end
