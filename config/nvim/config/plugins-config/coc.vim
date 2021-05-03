" Plugins {
" coc-git is causing start screen not to show
let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-lists',
  \ 'coc-jedi',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-yank',
  \ 'coc-marketplace',
  \ 'coc-highlight',
  \ 'coc-vimtex',
  \ '@yaegassy/coc-intelephense',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-prettier',
  \ 'coc-php-cs-fixer',
\ ]
" }

" CoC Related Settings {
" See coc-settings.json for more configuration
" Some servers have issues with backup files
set nobackup
set nowritebackup
" Remove messages from in-completion menus
set shortmess+=c
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" }

" CoC Colors {
highlight CocCodeLens gui=italic,bold guifg=#888888
" }

" Use tab for trigger completion {
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr>
    \ pumvisible() ? "\<C-g>u" :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }
