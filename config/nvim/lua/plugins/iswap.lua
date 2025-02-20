return {
    'mizlan/iswap.nvim',
    opts = {
        keys = 'qwerasdf',
        hl_snipe = 'ErrorMsg',
        hl_selection = 'WarningMsg',
        hl_grey = 'LineNr',
        flash_style = 'sequential',
        hl_flash = 'ModeMsg',
        autoswap = true,
        debug = nil,
        hl_grey_priority = '1000',
    },
    config = function(_, opts)
        local iswap = require('iswap')
        iswap.setup(opts)

        require('utils').nmap('<Leader>s', iswap.imove_with)
    end,
}
