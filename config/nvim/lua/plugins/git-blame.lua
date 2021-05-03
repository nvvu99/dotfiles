return function()
    vim.g.gitblame_message_template = '<author> • <summary> • <date>'
    vim.g.gitblame_date_format = '%H:%M, %x'
end
