return function()
    -- Utilities for creating configurations
    local util = require('formatter.util')
    local defaults = require('formatter.defaults')

    -- Provides the Format and FormatWrite commands
    require('formatter').setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
            css = util.withl(defaults.prettier, 'css'),
            html = util.withl(defaults.prettier, 'html'),
            javascript = require('formatter.filetypes.javascript').prettier,
            javascriptreact = require('formatter.filetypes.javascriptreact').prettier,
            json = util.withl(defaults.prettier, 'json'),
            markdown = util.withl(defaults.prettier, 'markdown'),
            scss = util.withl(defaults.prettier, 'scss'),
            typescript = util.withl(defaults.prettier, 'typescript'),
            typescriptreact = require('formatter.filetypes.typescriptreact').prettier,
            yaml = util.withl(defaults.prettier, 'yaml'),
            vue = util.withl(defaults.prettier, 'vue'),
            php = {
                function()
                    return {
                        exe = [[~/.config/composer/vendor/bin/php-cs-fixer]],
                        args = {
                            'fix',
                            '--rules=@PSR12,@PhpCsFixer',
                        },
                    }
                end,
            },
            python = require('formatter.filetypes.python').black,
            lua = require('formatter.filetypes.lua').stylua,
            -- Use the special "*" filetype for defining formatter configurations on
            -- any filetype
            ['*'] = {
                -- "formatter.filetypes.any" defines default configurations for any
                -- filetype
                require('formatter.filetypes.any').remove_trailing_whitespace,
            },
        },
    })
end
