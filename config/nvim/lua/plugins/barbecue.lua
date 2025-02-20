return {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = { 'SmiteshP/nvim-navic', lazy = true },
    opts = {
        create_autocmd = false, -- prevent barbecue from updating itself automatically
        show_dirname = false,
        show_modified = true,
        exclude_filetypes = { 'rest_nvim_result' },
        attach_navic = false,
    },
    config = function(_, opts)
        require('barbecue').setup(opts)

        vim.api.nvim_create_autocmd({
            'WinScrolled',
            'BufWinEnter',
            'CursorHold',
            'InsertLeave',
            'BufModifiedSet',
        }, {
            group = vim.api.nvim_create_augroup('barbecue.updater', {}),
            callback = function()
                require('barbecue.ui').update()
            end,
        })
    end,
}
