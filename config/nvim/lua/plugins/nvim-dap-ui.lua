return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
        'przepompownia/nvim-dap-tab',
        'theHamsta/nvim-dap-virtual-text',
    },
    opts = {
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
            {
                elements = {
                    'scopes',
                    'breakpoints',
                    'stacks',
                    'watches',
                },
                size = 0.25, -- 25% of total lines
                position = 'bottom',
            },
        },
    },
    config = function(_, opts)
        require('dapui').setup(opts)
        require('dap-tab').setup()
        require('nvim-dap-virtual-text').setup({})
    end,
}
