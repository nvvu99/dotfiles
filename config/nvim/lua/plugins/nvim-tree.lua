return function()
    require('nvim-tree').setup({
        view = {
            adaptive_size = true,
        },
        filters = {
            dotfiles = false,
        },
        update_focused_file = {
            update_root = true,
        },
    })
end
