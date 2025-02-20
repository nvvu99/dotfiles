return {
    'uga-rosa/ccc.nvim',
    opts = {
        highlighter = {
            auto_enable = true,
        },
        lsp = false,
    },
    config = function(_, opts)
        require('ccc').setup(opts)

        require('utils').nmap('<C-c>', function()
            require('ccc.core').new():pick()
        end)
    end,
}
