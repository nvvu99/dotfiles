return {
    'f-person/git-blame.nvim',
    init = function()
        vim.g.gitblame_message_template = '<author> • <summary> • <date>'
        vim.g.gitblame_date_format = '%Y-%m-%d, %H:%M'
    end,
}
