return {
    'kyazdani42/nvim-tree.lua',
    opts = {
        view = {
            adaptive_size = true,
        },
        filters = {
            dotfiles = false,
        },
        update_focused_file = {
            update_root = true,
        },
    },
    config = function(_, opts)
        require('nvim-tree').setup(opts)

        require('utils').nmap('<Leader>m', require('nvim-tree.api').tree.toggle)
    end,
}
