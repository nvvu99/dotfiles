return {
    'filipdutescu/renamer.nvim',
    version = '*',
    config = function()
        local renamer = require('renamer')
        renamer.setup()

        require('utils').map({ 'n', 'x', 'i' }, '<A-r>', renamer.rename)
    end,
}
