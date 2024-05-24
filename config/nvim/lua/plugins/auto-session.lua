return function()
    require('auto-session').setup({
        log_level = 'info',
        auto_save_enabled = true,
        auto_restore_enabled = true,
        session_lens = {
            load_on_setup = false,
        },
    })
end
