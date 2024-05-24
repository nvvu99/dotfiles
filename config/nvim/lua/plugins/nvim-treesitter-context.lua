return function()
    require('treesitter-context').setup({
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            default = {
                'class',
                'function',
                'method',
                'for',
                'while',
                'if',
                'switch',
                'case',
            },
        },
    })
end
