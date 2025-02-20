return {
    'rest-nvim/rest.nvim',
    init = function()
        vim.g.rest_nvim = {
            request = {
                skip_ssl_verification = true,
            },
        }
    end,
    config = function()
        require('utils').map({ 'n', 'v' }, '<leader>r', '<cmd>Rest run<cr>')
    end,
}
