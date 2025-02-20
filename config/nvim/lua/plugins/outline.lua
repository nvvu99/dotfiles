return {
    'hedyhli/outline.nvim',
    config = function()
        local outline = require('outline')
        outline.setup()

        require('utils').nmap('<Leader>.', outline.toggle)
    end,
}
