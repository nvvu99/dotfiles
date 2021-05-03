" Use agriculture as a global no hidden search
let g:agriculture#rg_options = '--hidden'
let g:agriculture#ag_options = '--hidden'
" Default FZF options with bindings to match layout and select all + none
let $FZF_DEFAULT_OPTS = join([
    \ '--layout=default',
    \ '--info inline',
    \ '--bind ' . join([
        \ 'ctrl-a:select-all',
        \ 'ctrl-d:deselect-all',
        \ 'tab:up',
        \ 'shift-tab:down',
        \ 'alt-f:toggle',
        \ 'ctrl-p:toggle-preview'
    \ ], ',')
\ ], ' ')

" Default command for FZF
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden'

" Default location for FZF
let g:fzf_layout = {
    \ 'window': 'call NewFZFWindow()'
\ }

" Ctrl-l populates arglist. Use with :cfdo. Only works in :Files
let g:fzf_action = {
    \ 'ctrl-t': {l -> execute('args ' . join(map(l, {_, v -> fnameescape(v)}), ' '))},
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
\ }

let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" Configures an FZF window
function! NewFZFWindow() abort
  new | wincmd J | resize 1
endfunction

" Some ripgrep searching defaults
function! RgCommand(ignore) abort
    return join([
        \ 'rg',
        \ '--hidden', '--color ansi', '--column',
        \ '--line-number', '--no-heading', '--smart-case',
        \ (a:ignore == 1 ? '--ignore' : '--no-ignore')
    \ ], ' ')
endfunction

" Adds prompt
function! PreviewFlags(prompt) abort
    return ' --prompt="' . a:prompt . '> "'
endfunction

" Ensure that only the 4th column delimited by : is filtered by FZF
function! RgPreviewFlags(prompt) abort
    return PreviewFlags(a:prompt) . ' --delimiter : --nth 4..'
endfunction

" Configs the preview
function! Preview(flags) abort
    return fzf#vim#with_preview({'options': a:flags})
endfunction

" Executes ripgrep with a preview
function! Rg(ignore, args, bang) abort
    let command = RgCommand(a:ignore).' '.shellescape(a:args)
    call fzf#vim#grep(command, 1, Preview(RgPreviewFlags(a:ignore ? 'Grep' : 'Global Grep')), a:bang)
    call animate#window_percent_height(0.8)
endfunction

" Opens files search with preview
function! Files(args, bang) abort
    call fzf#vim#files(a:args, Preview(PreviewFlags('Files')), a:bang)
    call animate#window_percent_height(0.5)
endfunction

" Opens lines with animation
function! Lines(args, bang) abort
    call fzf#vim#lines(a:args, a:bang)
    call animate#window_percent_height(0.8)
endfunction

" Opens buffers with animation
function! Buffers(args, bang) abort
    call fzf#vim#buffers(a:args, a:bang)
    call animate#window_percent_height(0.2)
endfunction

function! OnFZFOpen() abort
    call EnableCleanUI()
    call RefreshFZFPreview()
    startinsert
endfunction
