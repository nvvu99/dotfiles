local function progress()
    local cur = vim.fn.line('.')
    local total = vim.fn.line('$')

    return cur .. '/' .. total .. ' (' .. math.floor(cur / total * 100) .. '%%)'
end

return function()
    local git_blame = require('gitblame')

    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                { 'filename', path = 1 },
                { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
            },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = {
                { progress },
            },
            lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
    })
end
