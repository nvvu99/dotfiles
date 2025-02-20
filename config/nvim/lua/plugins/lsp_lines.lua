return {
    name = 'lsp_lines',
    url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    init = function()
        vim.diagnostic.config({
            virtual_text = false,
        })
    end,
    config = true,
}
