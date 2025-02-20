return {
    'filipdutescu/renamer.nvim',
    version = '*',
    config = function()
        local renamer = require('renamer')
        renamer.setup()

        local map = require('utils').map
        map('i', '<F2>', renamer.rename)
        map({ 'n', 'x' }, '<leader>rr', renamer.rename)
    end,
}
