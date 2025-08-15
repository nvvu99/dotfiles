return {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function(_, opts)
        require('trouble').setup(opts)
        local nmap = require('utils').nmap
        nmap('<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>')
        nmap('<leader>xX', '<cmd>Trouble diagnostics toggle<cr>')
        nmap('<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>')
        nmap('<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>')
        nmap('<leader>xL', '<cmd>Trouble loclist toggle<cr>')
        nmap('<leader>xQ', '<cmd>Trouble qflist toggle<cr>')
    end,
}
