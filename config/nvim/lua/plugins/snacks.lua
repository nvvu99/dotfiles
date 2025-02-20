return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {
            enabled = true,
            size = 1.5 * 1024 * 1024,
        },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        words = { enabled = true },
        git = { enabled = true },
        rename = { enabled = true },
    },
    config = function(_, opts)
        require('snacks').setup(opts)

        require('utils').nmap('<Leader>h', Snacks.notifier.show_history)

        local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
        vim.api.nvim_create_autocmd('User', {
            pattern = 'NvimTreeSetup',
            callback = function()
                local events = require('nvim-tree.api').events
                events.subscribe(events.Event.NodeRenamed, function(data)
                    if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
                        data = data
                        Snacks.rename.on_rename_file(data.old_name, data.new_name)
                    end
                end)
            end,
        })
    end,
}
