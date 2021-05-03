vim.cmd([[
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
]])

vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0

vim.g.syntastic_php_phpcs_args = '--standard=Framgia'
