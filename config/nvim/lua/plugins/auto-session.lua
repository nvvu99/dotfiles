return function()
    require('auto-session').setup({
        log_level = 'error',
        session_lens = {
            load_on_setup = false,
        },
        cwd_change_handling = true,
    })
end
