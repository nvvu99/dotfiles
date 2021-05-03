return function()
    -- require('dap.ext.vscode').load_launchjs('')
    local dap = require('dap')
    local debug_adapters_path = vim.fn.stdpath('config') .. '/debug-adapters'

    -- PHP
    dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { debug_adapters_path .. '/vscode-php-debug/out/phpDebug.js' },
    }
    dap.configurations.php = {
        {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            host = '0.0.0.0',
            port = 9000,
            log = true,
            proxy = {
                enable = true,
                key = 'PHPSTORM',
            },
        },
    }

    -- Javascript
    dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { debug_adapters_path .. '/vscode-node-debug2/out/src/nodeDebug.js' },
    }

    vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
end
