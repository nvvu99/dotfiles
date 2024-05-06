function terminate_dap()
    require('dap-tab').closeDebugWin()
    require('dap').terminate({}, { terminateDebuggee = true })
end

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, count = 98 })
local lazydocker = Terminal:new({ cmd = 'lazydocker', hidden = true, count = 99 })

function toggle_lazygit()
    lazygit.cmd = 'cd ' .. vim.fn.getcwd() .. ' && lazygit'
    lazygit:toggle()
end

function toggle_lazydocker()
    local docker_compose_folder = vim.fn.getcwd()
    if vim.g.docker_compose_folder then
        docker_compose_folder = vim.g.docker_compose_folder
    end

    print(docker_compose_folder)
    lazydocker.cmd = 'cd ' .. docker_compose_folder .. ' && lazydocker'
    lazydocker:toggle()
end
