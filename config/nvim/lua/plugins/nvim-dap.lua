local get_python_path = function()
    local venv_path = os.getenv('VIRTUAL_ENV')
    if venv_path then
        return venv_path .. '/bin/python'
    end

    return '/usr/bin/python'
end

return function()
    -- require('dap.ext.vscode').load_launchjs('')
    local vim_fn = vim.fn
    local dap = require('dap')
    local debug_adapters_path = vim_fn.stdpath('config') .. '/debug-adapters'

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

    -- Python
    dap.adapters.python = {
        type = 'executable',
        command = get_python_path(),
        args = { '-m', 'debugpy.adapter' },
    }
    dap.configurations.python = {
        {
            type = 'python',
            request = 'launch',
            name = 'Launch',
            program = '${file}',
            pythonPath = get_python_path(),
        },
    }

    -- Node
    dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
            command = 'node',
            args = { debug_adapters_path .. '/vscode-js-debug/src/dapDebugServer.js', '${port}' },
        },
    }
    local config = {
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
        },
    }
    dap.configurations.javascript = {
        config,
    }
    dap.configurations.typescript = {
        config,
    }

    vim_fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
end
