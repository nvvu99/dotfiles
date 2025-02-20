local function buffer_not_empty()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local function hide_in_width()
    return vim.fn.winwidth(0) > 80
end

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch', icon = '󰘬' },
                { 'diff', cond = hide_in_width },
            },
            lualine_c = {},
            lualine_x = {
                'filetype',
                'fileformat',
                { 'encoding', cond = hide_in_width },
            },
            lualine_y = {
                '%p%%/%L',
            },
            lualine_z = { 'location' },
        },
        tabline = {
            lualine_a = {
                { 'tabs', show_modified_status = false },
            },
            lualine_b = {
                'diagnostics',
                { 'filesize', cond = buffer_not_empty },
            },
            lualine_x = {
                {
                    'filename',
                    cond = buffer_not_empty,
                    path = 1,
                    symbols = { modified = '', readonly = '' },
                },
                {
                    function()
                        local msg = 'No Active Lsp'
                        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                        local clients = vim.lsp.get_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    icon = ' ',
                },
            },
            lualine_y = {
                { 'datetime', style = '%a, %b %d' },
            },
            lualine_z = {
                { 'datetime', style = '%H:%M' },
            },
        },
        extensions = {
            'nvim-dap-ui',
            'nvim-tree',
            'symbols-outline',
            'toggleterm',
            'trouble',
        },
    },
    config = function(_, opts)
        local git_blame = require('gitblame')

        table.insert(opts.sections.lualine_c, {
            git_blame.get_current_blame_text,
            cond = git_blame.is_blame_text_available,
        })

        require('lualine').setup(opts)
    end,
}
