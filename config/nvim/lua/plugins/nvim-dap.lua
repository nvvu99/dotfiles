local get_python_path = function()
    local venv_path = os.getenv('VIRTUAL_ENV')
    if venv_path then
        return venv_path .. '/bin/python'
    end

    return '/usr/bin/python'
end

return function()
    local vim_fn = vim.fn
    local dap = require('dap')
    local debug_adapters_path = vim_fn.stdpath('config') .. '/debug-adapters'

    dap.defaults.fallback.terminar_win_cmd = 'tabnew'

    -- PHP
    dap.adapters.php = {
        type = 'executable',
        command = 'php-debug-adapter',
    }

    -- Python
    dap.adapters.python = {
        type = 'executable',
        command = 'debugpy-adapter',
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
    local node_config = {
        {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
        },
    }
    dap.configurations.javascript = node_config
    dap.configurations.typescript = node_config

    vim_fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
end
