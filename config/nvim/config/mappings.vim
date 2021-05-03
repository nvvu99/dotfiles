let mapleader = ','
let maplocalleader = ','

" General {
nnoremap ; :
vnoremap ; :
" Escape in insert mode
inoremap jj <ESC>
" Escape in command mode
cnoremap jj <C-c>
" Escape in terminal mode
tnoremap <C-\> <C-\><C-n>
" Escape in visual mode
vnoremap <space><space> <ESC>
" Save file
nnoremap <silent> <C-s> :w!<CR>
" Save and close
nnoremap <silent> <Leader><S-w> :x<CR>
" Easy align in visual mode
xmap     ga <Plug>(EasyAlign)
" Easy align in normal mode
nmap     ga <Plug>(EasyAlign)
" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
xmap <BS> x
" Scroll the viewport faster
nnoremap <CR> 3<C-e>
nnoremap J 3<C-e>
nnoremap ' 3<C-y>
nnoremap K 3<C-y>
" Paste from clipboard
" nnoremap <C-v> "+P
inoremap <C-v> <C-r>+
" Copy to clipboard
vnoremap <C-c> "+y
" Select all
nnoremap <C-a> ggVG
" Copy from cursor to end of line
nmap Y y$
" Toggle fold
nnoremap <Space> za
" Easier indenting of code blocks
vnoremap < <gv
vnoremap > >gv
" Copy absolute file path
nnoremap cpa :let @+ = expand('%:p')<cr>
" Copy relative file path
nnoremap cpr :let @+ = expand('%:.')<cr>
" }

" Search {
" Open fuzzy files with leader \
nnoremap <silent> \\ :Files<CR>
" Open fuzzy lines with leader l
nnoremap <silent> <Leader>l :Lines<CR>
" Open fuzzy buffers with leader b
nnoremap <silent> <Leader>b :Buffers<CR>
" Open ripgrep
nnoremap <silent> <Leader>f :Rg<CR>
" Open global ripgrep
nnoremap <silent> <Leader><S-f> :Rgg<CR>
" Open ripgrep agriculture
nmap <Leader>/ <Plug>AgRawSearch
" Open ripgrep agriculture for visual selection
vmap <Leader>/ <Plug>AgRawVisualSelection
" Remap ** to * now that we are using * for other bindings
" nnoremap ** *
" Open ripgrep agriculture for cursor word
" nmap */ <Plug>AgRawWordUnderCursor
" Open ripgrep for cursor word
" nnoremap <silent> *f :Ag <C-R><C-W><CR>
" Open global ripgrep for cursor word
" nnoremap <silent> *<S-f> :Rgg <C-R><C-W><CR>
" }

" Switching {
" Next tab
nnoremap <silent> <Tab> :tabnext<CR>
" Previous buffer
nnoremap <silent> <S-Tab> :tabprevious<CR>
" Alternate file navigation
nnoremap <silent> <Leader>a :A<CR>
" Alternate file navigation vertical split
nnoremap <silent> <Leader><S-a> :AV<CR>
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }

" View Management {
" Toggle Defx
nnoremap <silent> <leader>m :Defx <cr>
" Toggle Tagbar
nnoremap <silent> <leader>. :TagbarToggle<CR>
" Create vsplit
nnoremap <silent> <leader>\ :call Vsplit()<CR>
" Create hsplit
nnoremap <silent> <Leader>- :call Split()<CR>
" Only window
nnoremap <silent> <Leader>o :only<CR>
" Close the current buffer
nnoremap <silent> <Leader>c :close<CR>
" Close the current buffer
nnoremap <silent> <Leader><S-c> :%close<CR>
" Delete the current buffer
nnoremap <silent> <Leader>x :bdelete<CR>
" Delete the current buffer
nnoremap <silent> <Leader><S-x> :bdelete!<CR>
" Force close all buffers
nnoremap <silent> <Leader>z :%bdelete<CR>
" Close all buffers
nnoremap <silent> <Leader><S-z> :%bdelete!<CR>
" Remap arrows to resize
nnoremap <silent> <Up>    :call animate#window_delta_height(15)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-15)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(30)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-30)<CR>
" }

" Conquer of Completion {
" Get outline
nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
" Get symbols
nnoremap <silent> <Leader>cs :<C-u>CocList -I symbols<CR>
" Get errors
nnoremap <silent> <Leader>cl :<C-u>CocList locationlist<CR>
" Get available commands
nnoremap <silent> <Leader>cc :<C-u>CocList commands<CR>
" Rename
nmap <leader>r <Plug>(coc-rename)
" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Go to references
nmap <silent> gr <Plug>(coc-references)
" Get hint
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" }

" Fuzzy Finder {
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }

" Custom Tools {
" Cycle line number modes
nnoremap <silent> <Leader>n :call CycleLineNumbering()<CR>
" Toggle virtualedit
nnoremap <silent> <Leader>v :call ToggleVirtualEdit()<CR>
" Open lazygit
nnoremap <silent> <Leader>g :call openterm#horizontal('lazygit', 0.8)<CR>
" Open lazydocker
nnoremap <silent> <Leader>d :call openterm#horizontal('lazydocker', 0.8)<CR>
" Open scratch pad
nnoremap <silent> <Leader>sc :call openterm#horizontal('zsh', 0.2)<CR>
" Calls the custom start function that requests path map to be defined if not already run
" nnoremap <silent> <F5> :call StartVdebug()<CR>
" }

" Floaterm {
let g:floaterm_keymap_new    = '<F4>'
let g:floaterm_keymap_prev   = '<A-Left>'
let g:floaterm_keymap_next   = '<A-Right>'
let g:floaterm_keymap_toggle = '<A-t>'
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <A-Left>    <C-\><C-n>:FloatermPrev<CR>
tnoremap   <silent>   <A-Right>    <C-\><C-n>:FloatermNext<CR>
tnoremap   <silent>   <A-t>   <C-\><C-n>:FloatermToggle<CR>
" }
