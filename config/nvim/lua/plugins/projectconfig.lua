return function()
    require('nvim-projectconfig').setup({
        project_dir = '~/.config/projects/',
        autocmd = true,
    })
end
