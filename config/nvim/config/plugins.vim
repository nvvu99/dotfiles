let g:config_root = '~/.config/nvim'
let g:vim_plug_dir = g:config_root . '/autoload/plug.vim'
let g:plugin_dir = g:config_root . '/plugged'

" Install vim-plug if not already installed {
if empty(glob(g:vim_plug_dir))
  if has('win32')
    silent !curl -fLo \%localappdata\%\\nvim\\autoload\\plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif
" }

" Custom Vim Plug {
" Options for each plugin, helps improve readability of plugin registration
let g:vim_plug_opts = {
  \ 'neoclide/coc.nvim':   {'branch': 'release' },
  \  'dracula/vim':        { 'as':  'dracula' },
  \  'shougo/defx.nvim':   { 'do':  ':UpdateRemotePlugins' },
  \'psliwka/vim-smoothie': { 'on': [] },
  \'glacambre/firenvim': { 'do': { _ -> firenvim#install(0) } }
\ }
" }

" Register plugin with options {
function! Plug(plugin) abort
  let plugin = substitute(a:plugin, "'", '', 'g')
  call plug#(plugin, get(g:vim_plug_opts, plugin, {}))
endfunction
" }

" Plugins {
" Begin vim plug
call plug#begin(expand(g:plugin_dir))


" Custom command for registering plugins, must follow plug#begin
command! -nargs=1 -bar Plug call Plug(<f-args>)

" Defaults {
Plug 'tpope/vim-sensible'            | " Sensible defaults
Plug 'wincent/terminus'              | " Mouse support
" }

" Search {
Plug 'jesseleite/vim-agriculture'    | " Ripgrep options for FZF
Plug 'junegunn/fzf'                  | " Main FZF plugin
Plug 'junegunn/fzf.vim'              | " Fuzzy finding plugin
" }

" Navigation {
" Plug 'tpope/vim-projectionist'       | " Navigation of related files
Plug 'easymotion/vim-easymotion'
Plug 'bkad/camelcasemotion'
Plug 'shougo/defx.nvim'              | " File explorer
Plug 'kristijanhusak/defx-icons'     | " File explorer icons
Plug 'kristijanhusak/defx-git'       | " File explorer git integrate
" }

" Visual {
Plug 'arecarn/vim-clean-fold'        | " Provides function for folds
Plug 'tmhedberg/simpylfold'
Plug 'vim-scripts/restore_view.vim'  | " Restore cursor position and folding
Plug 'camspiers/animate.vim'         | " Animation plugin
Plug 'ryanoasis/vim-devicons'        | " Dev icons
Plug 'vim-airline/vim-airline'       | " Statusline
Plug 'enricobacis/vim-airline-clock' | " Clock for statusline
Plug 'wincent/loupe'                 | " Search context improvements
Plug 'luochen1990/rainbow'           | " Bracket highlighter
Plug 'yggdroot/indentline'           | " Display indent
Plug 'dracula/vim'                   | " Dracula colorscheme
Plug 'psliwka/vim-smoothie'          | " Nicer scrolling
Plug 'blueyed/vim-diminactive'            | " Makes determining active window easier
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" }

" Editor {
Plug 'editorconfig/editorconfig-vim' | " Import tabs etc from editorconfig
Plug 'junegunn/vim-easy-align'       | " Helps alignment
Plug 'kkoomen/vim-doge'              | " Docblock generator
Plug 'neoclide/coc.nvim'             | " Completion provider
Plug 'matze/vim-move'                | " Move lines
Plug 'romainl/vim-cool'              | " Awesome search highlighting
Plug 'tomtom/tcomment_vim'           | " Better commenting
Plug 'tpope/vim-repeat'              | " Improves repeat handling
Plug 'tpope/vim-surround'            | " Surround motions
Plug 'wellle/targets.vim'            | " Move text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'tomtom/tlib_vim'               | " Some utility functions
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'sbdchd/neoformat'              | " Code formatter
Plug 'jiangmiao/auto-pairs'          | " Auto pairs brackets
Plug 'lervag/vimtex'
Plug 'chiel92/vim-autoformat'
" }

" Tools {
Plug 'dhruvasagar/vim-table-mode'   | " Better handling for tables in markdown
Plug 'voldikss/vim-floaterm'        | " Floating terminal
Plug 'reedes/vim-pencil'            | " Auto hard breaks for text files
Plug 'samoshkin/vim-mergetool'      | " Merge tool for git
Plug 'tpope/vim-fugitive'           | " Git tools
Plug 'tpope/vim-obsession'          | " Save sessions automatically
Plug 'tpope/vim-speeddating'        | " Tools for working with dates
Plug 'tpope/vim-unimpaired'         | " Common mappings for many needs
Plug 'terryma/vim-multiple-cursors' | " Multiple cursors support
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'          | " Interactive scratchpad
Plug 'itchyny/calendar.vim'         | " Nice calendar app
Plug 'vim-vdebug/vdebug'            | " Debugging
Plug 'ludovicchabant/vim-lawrencium'
Plug 'glacambre/firenvim'           | " Enables nvim in browser
" }

" Syntax {
Plug 'phalkunz/vim-ss'               | " SilverStripe templates
Plug 'sheerun/vim-polyglot'          | " Lang pack
" Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'scrooloose/syntastic'
" }

" End the plugin registration
call plug#end()
" }
