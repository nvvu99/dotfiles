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
    lazydocker.cmd = 'cd ' .. vim.fn.getcwd() .. ' && lazydocker'
    lazydocker:toggle()
end
