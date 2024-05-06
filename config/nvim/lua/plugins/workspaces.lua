return {
    hooks = {
        open_pre = {
            'lua terminate_dap()',
            'SessionSave',
            'silent %bdelete!',
        },
        open = {
            'SessionRestore',
            'LspRestart',
        },
    },
}
