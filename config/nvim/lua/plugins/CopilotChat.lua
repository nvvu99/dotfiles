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
}
