return {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
        keys = 'etovxqpdygfblzhckisuran',
    },
    config = function(_, opts)
        local hop = require('hop')
        hop.setup(opts)

        local directions = require('hop.hint').HintDirection
        local nmap = require('utils').nmap
        local map = require('utils').map
        map('', 'f', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end)
        map('', 'F', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end)
        map('', 't', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end)
        map('', 'T', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end)

        nmap('<Leader><Leader>w', hop.hint_words)
        nmap('<Leader><Leader>c', hop.hint_char1)
    end,
}
