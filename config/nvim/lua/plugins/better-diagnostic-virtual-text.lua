return {
    'sontungexpt/better-diagnostic-virtual-text',
    event = 'LspAttach',
    opts = {
        inline = false,
    },
    init = function()
        vim.diagnostic.config({
            virtual_text = false,
        })
    end,
}
