-- General
nmap(';', ':')
vmap(';', ':')
-- Escape in command mode
cmap('jj', '<C-c>')
-- Escape in terminal mode
tmap('<C-\\>', '<C-\\><C-n>')
-- Escape in visual mode
vmap('<space><space>', '<ESC>')
-- Easy align in visual mode
xmap('ga', '<Plug>(EasyAlign)')
-- Easy align in normal mode
nmap('ga', '<Plug>(EasyAlign)')
-- Scroll the viewport faster
-- nmap('<Cr>', '3<C-e>')
-- nmap("'", '3<C-y>')
-- Copy from cursor to end of line
nmap('Y', 'y$')
-- Toggle fold
nmap('<Space>', 'za')
-- Easier indenting of code blocks
vmap('<', '<gv')
vmap('>', '>gv')
-- Copy absolute file path
nmap('cpa', ":let @+ = expand('%:p')<cr>")
-- Copy relative file path
nmap('cpr', ":let @+ = expand('%:.')<cr>")

-- Switching tab
-- Next tab
nmap('<S-Tab>', ':tabprevious<Cr>')
nmap('<Tab>', ':tabnext<Cr>')
-- Better window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Resize buffer
nmap('<Up>', '<Cmd> resize -3<Cr>')
nmap('<Down>', '<Cmd> resize +3<Cr>')
nmap('<Left>', '<Cmd> vertical resize +5<Cr>')
nmap('<Right>', '<Cmd> vertical resize -5<Cr>')

-- View Management
-- Toggle NvimTree
nmap('<Leader>m', ':NvimTreeToggle<Cr>')
-- Toggle Symbols outline
nmap('<Leader>.', ':SymbolsOutline<Cr>')
-- Create vsplit
nmap('<Leader>\\', ':vsplit<Cr>')
-- Create hsplit
nmap('<Leader>-', ':split<Cr>')
-- Only window
nmap('<Leader>o', ':only<Cr>')
-- Close the current buffer
nmap('<Leader><S-c>', ':%close<Cr>')
-- Delete the current buffer
nmap('<Leader>x', ':bdelete<Cr>')
-- Delete the current buffer
nmap('<Leader><S-x>', ':bdelete!<Cr>')
-- Force close all buffers
nmap('<Leader>z', ':%bdelete<Cr>')
-- Close all buffers
nmap('<Leader><S-z>', ':%bdelete!<Cr>')

-- Color picker
nmap('<C-c>', '<Cmd>CccPick<Cr>')

-- FzfLua
nmap('\\\\', ':FzfLua files<Cr>')
nmap('<Leader>f', ':FzfLua live_grep_native<Cr>')
nmap('<Leader>l', ':FzfLua blines<Cr>')
nmap('<Leader>b', ':FzfLua buffers<Cr>')
nmap('<Leader>c', ':FzfLua git_bcommits<Cr>')
nmap('<Leader>g', ':lua toggle_lazygit()<Cr>')
nmap('<Leader>d', ':lua toggle_lazydocker()<Cr>')
nmap('gD', ':FzfLua lsp_declarations<Cr>')
nmap('gd', ':FzfLua lsp_definitions<Cr>')
nmap('gt', ':FzfLua lsp_typedefs<Cr>')
nmap('gi', ':FzfLua lsp_implementations<Cr>')
nmap('gr', ':FzfLua lsp_references<Cr>')

-- Nvim DAP
nmap('<F1>', "<Cmd> lua require('dap').step_back()<Cr>")
nmap('<F2>', "<Cmd> lua require('dap').step_over()<Cr>")
nmap('<F3>', "<Cmd> lua require('dap').step_into()<Cr>")
nmap('<F4>', "<Cmd> lua require('dap').step_out()<Cr>")
nmap('<F5>', "<Cmd> lua require('dap').continue()<Cr>")
nmap('<F6>', '<Cmd> lua terminate_dap()<Cr>')
nmap('<F9>', "<Cmd> lua require('dap').run_to_cursor()<Cr>")
nmap('<F10>', "<Cmd> lua require('dap').toggle_breakpoint()<Cr>")
nmap('<F11>', "<Cmd> lua require('dap').clear_breakpoints()<Cr>")

-- Nvim ufo
nmap('zR', "<Cmd> lua require('ufo').openAllFolds()<Cr>")
nmap('zM', "<Cmd> lua require('ufo').closeAllFolds()<Cr>")

-- Rest nvim
nmap('<Leader>r', '<Plug>RestNvim')
nmap('<Leader><leader>r', '<Plug>RestNvimLast')

-- LSP
nmap('K', '<Cmd> lua vim.lsp.buf.hover()<Cr>')

-- Reverse join
nmap('<Leader>J', "<Cmd>lua require('trevj').format_at_cursor()<Cr>")

-- ISwap
nmap('<Leader>s', ':ISwapWith<Cr>')

-- Renamer
imap('<F2>', '<Cmd>lua require("renamer").rename()<Cr>')
nmap('<Leader>rn', '<Cmd>lua require("renamer").rename()<Cr>')
vmap('<Leader>rn', '<Cmd>lua require("renamer").rename()<Cr>')

-- Hop
map(
    '',
    'f',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
)
map(
    '',
    'F',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
)
map(
    '',
    't',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
)
map(
    '',
    'T',
    "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
)
nmap('<Leader><Leader>w', ':HopWord<Cr>')
nmap('<Leader><Leader>c', ':HopChar1<Cr>')

-- Renamer
imap('<F2>', '<cmd>lua require("renamer").rename()<Cr>')
nmap('<leader>rr', '<cmd>lua require("renamer").rename()<Cr>')
vmap('<leader>rr', ':lua require("renamer").rename()<Cr>')
