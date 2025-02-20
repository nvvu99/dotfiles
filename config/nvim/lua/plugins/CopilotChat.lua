return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = 'zbirenbaum/copilot.lua',
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
        window = {
            layout = 'float',
            width = 0.8,
            height = 0.8,
            border = 'rounded',
        },
    },
    config = function(_, opts)
        local copilot_chat = require('CopilotChat')
        copilot_chat.setup(opts)

        require('utils').map({ 'n', 'x' }, '<A-c>', copilot_chat.toggle)
    end,
}
