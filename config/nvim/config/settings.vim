" General {
" set clipboard=unnamedplus            | " System clipboard
set dictionary=/usr/share/dict/words | " Set up a dictionary
set encoding=UTF-8                   | " Default file encoding
set hidden                           | " Make buffers hidden then abandoned
set noautochdir                      | " Don't change dirs automatically
set noerrorbells                     | " No sound
set signcolumn=yes                   | " Show signcolumns
set splitbelow splitright            | " Split defaults
set undofile                         | " Enable undo persistence across sessions
set wildignore+=*.aux,*.out,*.toc    | " LaTeX
set wildignore+=*.orig               | " Merge files
set wildignore+=*.sw?                | " Vim swap files
set wildignore+=.DS_Store            | " OSX files
set wildignore+=.git,.hg             | " Version control files
set title
" }

" Search {
set ignorecase         | " Ignores case in search
set smartcase          | " Overrides ignore when capital exists
if has('nvim')
  set inccommand=split | " Displays incremental replacement
endif
" }

" Editor {
set expandtab      | " Expand tab to spaces
set shiftwidth=4   | " Number of spaces for indentation
set spelllang=en   | " Spell checking
set tabstop=4      | " Number of spaces a <Tab> is
set smarttab       | " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set softtabstop=4  | " edit as if the tabs are 4 characters wide
set shiftround     | " round indent to a multiple of 'shiftwidth'
set timeoutlen=300 | " Wait less time for mapped sequences
" }

" Visual {
set background=dark
let base16colorspace=256                    | " Access colors present in 256 colorspace
set termguicolors                           | " Enables 24bit colors
colorscheme dracula                         | " Sets theme to dracula
set foldtext=clean_fold#fold_text_minimal() | " Clean folds
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=1
set noshowmode                              | " Don't show mode changes
set novisualbell                            | " Don't display visual bell
set wrap                                    | " Wrap lines
set fo-=t                                   | " Don't automatically wrap text on typing
set wrapmargin=8                            | " wrap lines when coming within n characters from side
set breakindent
set breakindentopt=shift:4,sbr
set linebreak
set number                                  | " Show line numbers
set relativenumber                          | " Make line numbers relative
set showmatch                               | " Show matching braces
set cursorline
set tw=80
set cc=+1

" Highlight Customizations {
highlight Comment gui=italic,bold           | " Make comments italic
" }

" WSL clipboard {
" let g:clipboard = {
"   \   'name': 'WslClipboard',
"   \   'copy': {
"   \      '+': 'clip.exe',
"   \      '*': 'clip.exe',
"   \    },
"   \   'paste': {
"   \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"   \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"   \   },
"   \   'cache_enabled': 0,
"   \ }
" }
" }
