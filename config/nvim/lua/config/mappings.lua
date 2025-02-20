local set_keymap = vim.keymap.set

-- General
set_keymap({ 'n', 'v' }, ';', ':')
-- Escape in terminal mode
set_keymap('t', '<C-\\>', '<C-\\><C-n>')
-- Escape in visual mode
set_keymap('x', '<space><space>', '<ESC>')
-- Copy from cursor to end of line
set_keymap('n', 'Y', 'y$')
-- Toggle fold
set_keymap('n', '<Space>', 'za')
-- Easier indenting of code blocks
set_keymap('x', '<', '<gv')
set_keymap('x', '>', '>gv')
-- Copy absolute file path
set_keymap('n', 'cpa', ":let @+ = expand('%:p')<cr>")
-- Copy relative file path
set_keymap('n', 'cpr', ":let @+ = expand('%:.')<cr>")

-- Switching tab
-- Next tab
set_keymap('n', '<S-Tab>', ':tabprevious<Cr>')
set_keymap('n', '<Tab>', ':tabnext<Cr>')
-- Better window navigation
set_keymap('n', '<C-h>', '<C-w>h')
set_keymap('n', '<C-j>', '<C-w>j')
set_keymap('n', '<C-k>', '<C-w>k')
set_keymap('n', '<C-l>', '<C-w>l')

-- Resize buffer
set_keymap('n', '<Up>', '<Cmd> resize -3<Cr>')
set_keymap('n', '<Down>', '<Cmd> resize +3<Cr>')
set_keymap('n', '<Left>', '<Cmd> vertical resize +5<Cr>')
set_keymap('n', '<Right>', '<Cmd> vertical resize -5<Cr>')

-- View Management
-- Create vsplit
set_keymap('n', '<Leader>\\', ':vsplit<Cr>')
-- Create hsplit
set_keymap('n', '<Leader>-', ':split<Cr>')
-- Only window
set_keymap('n', '<Leader>o', ':only<Cr>')
-- Close the current buffer
set_keymap('n', '<Leader><S-c>', ':%close<Cr>')
-- Delete the current buffer
set_keymap('n', '<Leader>x', ':bdelete<Cr>')
-- Delete the current buffer
set_keymap('n', '<Leader><S-x>', ':bdelete!<Cr>')
-- Close all buffers
set_keymap('n', '<Leader>z', ':%bdelete<Cr>')
-- Force close all buffers
set_keymap('n', '<Leader><S-z>', ':%bdelete!<Cr>')

-- Nvim spider
-- set_keymap({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
-- set_keymap({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
-- set_keymap({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
-- set_keymap({ 'n', 'o', 'x' }, 'ge', "<cmd>lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })
