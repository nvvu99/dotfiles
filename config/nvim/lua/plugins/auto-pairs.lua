return function()
    vim.g.AutoPairs = {
        ['('] = ')',
        ['['] = ']',
        ['{'] = '}',
        ["'"] = "'",
        ['"'] = '"',
        ['`'] = '`',
        ['```'] = '```',
        ["'''"] = "'''",
        ['"""'] = '"""',
        ['<!--'] = '-->',
        ['\\w\\zs<'] = '>',
    }
    vim.g.AutoPairsShortcutBackInsert = '<C-b>'
end
