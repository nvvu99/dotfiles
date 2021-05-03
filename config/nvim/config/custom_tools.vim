" Enabled appropriate options for text files
function! EnableTextFileSettings() abort
  setlocal spell
  " EnableAutocorrect
  silent TableModeEnable
  call pencil#init({'wrap': 'hard'})
endfunction

" Cycle through relativenumber + number, number (only), and no numbering.
function! CycleLineNumbering() abort
  execute {
    \ '00': 'set relativenumber   | set number',
    \ '01': 'set norelativenumber | set number',
    \ '10': 'set norelativenumber | set nonumber',
    \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
endfunction
" Toggle virtualedit
function! ToggleVirtualEdit() abort
  if &virtualedit != "all"
    set virtualedit=all
  else
    set virtualedit=
  endif
endfunction
" Start Vdebug and request pathmap if not yet set
let g:register_vdebug = 0
function! StartVdebug() abort
  if g:register_vdebug == 0
    call RegisterVdebug()
    let g:register_vdebug = 1
  endif
  python3 debugger.run()
endfunction
" Vdebug needs to be able to load files and understand how the file in the docker
function! RegisterVdebug() abort
  call plug#load('vdebug')
  call inputsave()
  let server_root = input("Server Path> ", '/var/www/html/')
  let local_root = input("Local Path> ", getcwd())
  call inputrestore()
  normal :<ESC>
  let g:vdebug_options.path_maps[server_root] = local_root
endfunction
" Creates a vsplit in an animated fashion
function! Vsplit() abort
  vsplit
  call NaturalVerticalDrawer()
endfunction
" Creates a split with animation
function! Split() abort
  split
  call NaturalDrawer()
endfunction
" Creates a drawer effect that respects the natural height
function! NaturalDrawer() abort
  let height = winheight(0)
  resize 1
  call animate#window_absolute_height(height)
endfunction
" Creates a drawer effect that respects the natural width
function! NaturalVerticalDrawer() abort
  let width = winwidth(0)
  vertical resize 1
  call animate#window_absolute_width(width)
endfunction

" Animate the quickfix and ensure it is at the bottom
function! OpenQuickFix() abort
  if getwininfo(win_getid())[0].loclist != 1
    wincmd J
  endif
  call NaturalDrawer()
endfunction

" Configures an FZF window
function! NewFZFWindow() abort
  new | wincmd J | resize 1
endfunction

" Enables UI styles suitable for terminals etc
function! EnableCleanUI() abort
  setlocal listchars=
    \ nonumber
    \ norelativenumber
    \ nowrap
    \ winfixwidth
    \ laststatus=0
    \ noshowmode
    \ noruler
    \ scl=no
    \ colorcolumn=
  autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endfunction

" There's an issue with animating FZF. The preview sees the terminal as having
" a small height, and therefore doesn't render the preview with any lines
" this hack is to toggle the preview on and off, thereby rerendering the
" preview
function! RefreshFZFPreview() abort
  if has('nvim')
    if exists('g:last_open_term_id') && g:last_open_term_id
      call timer_start(350, {t->chansend(g:last_open_term_id, "\<C-p>\<C-p>")})
    endif
  else
    call term_sendkeys(bufnr('%'), "\<C-p>\<C-p>")
  endif
endfunction

function! CompileMarkdown() abort
  " :only
  let md_file = expand('%:p')
  " Create temporary working directory if the directory structure doesn't exist
  let tmp_dir = '/tmp/vim-markdown-preview/'
  if empty(glob(tmp_dir))
    call system('mkdir -p ' . tmp_dir)
  endif

  let pdf_file = tmp_dir . expand('%:t:r') . '.pdf'
  call system('pandoc -s -o ' . pdf_file . ' ' . md_file)
  call TermPDF(pdf_file)
endfunction

let g:termpdf_lastcalled = 0
function! TermPDF(file) abort
  " implement some basic throttling
  if g:termpdf_lastcalled == 0
    call system('zathura ' . a:file . ' &')
    let g:termpdf_lastcalled = 1
  endif
endfunction
