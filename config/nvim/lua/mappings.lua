local set_keymap = vim.keymap.set

-- General
set_keymap({ 'n', 'v' }, ';', ':')
-- Escape in command mode
set_keymap('c', 'jj', '<C-c>')
-- Escape in terminal mode
set_keymap('t', '<C-\\>', '<C-\\><C-n>')
-- Escape in visual mode
set_keymap('x', '<space><space>', '<ESC>')
-- Easy align in visual mode
set_keymap('x', 'ga', '<Plug>(EasyAlign)')
-- Easy align in normal mode
set_keymap('n', 'ga', '<Plug>(EasyAlign)')
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
-- Toggle NvimTree
set_keymap('n', '<Leader>m', ':NvimTreeToggle<Cr>')
-- Toggle Symbols outline
set_keymap('n', '<Leader>.', ':SymbolsOutline<Cr>')
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

-- Color picker
set_keymap('n', '<C-c>', '<Cmd>CccPick<Cr>')

-- Telescope
local telescope_builtin = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions
set_keymap('n', '<Leader>n', telescope_builtin.find_files)
-- set_keymap('n', '<Leader>f', telescope_builtin.live_grep)
set_keymap('n', '<Leader>f', telescope_extensions.egrepify.egrepify)
set_keymap('n', '<Leader>b', telescope_builtin.buffers)
set_keymap('n', '<Leader>c', telescope_builtin.git_bcommits)
set_keymap('n', '<Leader>w', telescope_extensions.workspaces.workspaces)
set_keymap('n', 'gd', telescope_builtin.lsp_definitions)
set_keymap('n', 'gt', telescope_builtin.lsp_type_definitions)
set_keymap('n', 'gi', telescope_builtin.lsp_implementations)
set_keymap('n', 'gr', telescope_builtin.lsp_references)

-- ToggleTerm
set_keymap('n', '<Leader>g', toggle_lazygit)
set_keymap('t', '<Leader>g', toggle_lazygit)
set_keymap('n', '<Leader>d', toggle_lazydocker)
set_keymap('t', '<Leader>d', toggle_lazydocker)

-- Nvim DAP
local dap = require('dap')
set_keymap('n', '<F1>', dap.step_back)
set_keymap('n', '<F2>', dap.step_over)
set_keymap('n', '<F3>', dap.step_into)
set_keymap('n', '<F4>', dap.step_out)
set_keymap('n', '<F5>', dap.continue)
set_keymap('n', '<F6>', terminate_dap)
set_keymap('n', '<F9>', dap.run_to_cursor)
set_keymap('n', '<F10>', dap.toggle_breakpoint)
set_keymap('n', '<F11>', dap.clear_breakpoints)

-- Nvim ufo
local ufo = require('ufo')
set_keymap('n', 'zR', ufo.openAllFolds)
set_keymap('n', 'zM', ufo.closeAllFolds)

-- Rest nvim
set_keymap('n', '<Leader>r', '<Plug>RestNvim')
set_keymap('n', '<Leader><leader>r', '<Plug>RestNvimLast')

-- LSP
set_keymap('n', 'K', vim.lsp.buf.hover)

-- ISwap
set_keymap('n', '<Leader>s', ':ISwapWith<Cr>')

-- Hop
set_keymap(
    '',
    'f',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
)
set_keymap(
    '',
    'F',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
)
set_keymap(
    '',
    't',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
)
set_keymap(
    '',
    'T',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
)
set_keymap('n', '<Leader><Leader>w', ':HopWord<Cr>')
set_keymap('n', '<Leader><Leader>c', ':HopChar1<Cr>')

-- Renamer
set_keymap('i', '<F2>', require('renamer').rename)
set_keymap({ 'n', 'x' }, '<leader>rr', require('renamer').rename)

-- Nvim spider
-- set_keymap({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
-- set_keymap({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
-- set_keymap({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
-- set_keymap({ 'n', 'o', 'x' }, 'ge', "<cmd>lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })
