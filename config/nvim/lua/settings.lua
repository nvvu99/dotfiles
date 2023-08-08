local opt = vim.opt

-- General
opt.mouse = 'a'
opt.dictionary = '/usr/share/dict/words'
opt.encoding = 'UTF-8'
opt.hidden = true
opt.autochdir = false
opt.errorbells = true
opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.wildignore:append('*.aux,*.out,*.toc')
opt.wildignore:append('*.orig')
opt.wildignore:append('*.sw?')
opt.wildignore:append('.DS_Store')
opt.wildignore:append('.git,.hg')
opt.updatetime = 500

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = 'split'

-- Editor
opt.expandtab = true
opt.shiftwidth = 4
-- opt.spell = true
-- opt.syntax = 'on'
-- opt.spelllang = "en_us"
opt.tabstop = 4
opt.smarttab = true
opt.softtabstop = 4
opt.shiftround = true
opt.timeoutlen = 300

-- Visual
opt.background = 'dark'
opt.termguicolors = true
opt.foldmethod = 'manual'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- opt.foldmarker = '{,}'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = '1'
opt.foldenable = true
opt.showmode = false
opt.visualbell = false
opt.wrap = true
opt.wrapmargin = 8
opt.breakindent = true
opt.breakindentopt = 'shift:4,sbr'
opt.linebreak = true
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.cursorline = true
opt.tw = 80
opt.cc = '+1'
opt.list = true
opt.listchars:append('space:⋅')
opt.listchars:append('eol:↴')
opt.title = true
opt.exrc = true

vim.cmd([[
let base16colorspace=256
colorscheme dracula
set fo-=t
]])
