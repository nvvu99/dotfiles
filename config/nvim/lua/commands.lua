local create_command = vim.api.nvim_create_user_command

create_command('ReloadConfig', 'source $MYVIMRC | PackerCompile', {})
