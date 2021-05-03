let s:direction = 'leftabove'

" autocmd VimEnter * call StartExplorer()

function! StartExplorer() abort
    if argc() == 1 && isdirectory(argv()[0]) 
        " && !exists("s:std_in")  
        exe 'cd' argv()[0]
        " exe 'CocCommand explorer --sources=file+ .'
        exe 'Defx'
    elseif argc() == 0
        exe 'Defx'
    endif
endfunction

function! s:setcolum() abort
    return 'mark:indent:git:icons:filename:type'
endfunction

function! s:ignored_files() abort
    return join([
        \ '.git/',
        \ 'node_modules',
        \ '__pycache__',
        \ 'venv',
        \ '*.class',
        \ '*.o',
        \ '*.exe',
    \ ], ',')
endfunction

call defx#custom#option('_', {
    \ 'columns': s:setcolum(),
    \ 'split': 'vertical',
    \ 'direction': s:direction,
    \ 'ignored_files': s:ignored_files(),
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
\ })

call defx#custom#column('mark', {
    \ 'readonly_icon': '',
    \ 'selected_icon': '',
\ })

augroup vfinit
    au!
    autocmd FileType defx call s:defx_init()
    " auto close last defx windows
    autocmd BufEnter * nested if
        \ (!has('vim_starting') && winnr('$') == 1
        \ && &filetype ==# 'defx') |
        \ call s:close_last_vimfiler_windows() | endif
    augroup END

    function! s:defx_init()
    setl listchars=
    setl nofoldenable
    setl foldmethod=manual
    setl nu rnu

    " disable this mappings
    nnoremap <silent><buffer> <3-LeftMouse> <Nop>
    nnoremap <silent><buffer> <4-LeftMouse> <Nop>
    nnoremap <silent><buffer> <LeftMouse> <LeftMouse><Home>

    silent! nunmap <buffer> <Space>
    silent! nunmap <buffer> <C-l>
    silent! nunmap <buffer> <C-j>
    silent! nunmap <buffer> E
    silent! nunmap <buffer> gr
    silent! nunmap <buffer> gf
    silent! nunmap <buffer> -
    silent! nunmap <buffer> s

    nnoremap <silent><buffer><expr> v
        \ defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> V
        \ defx#do_action('toggle_select_all')

    " Define mappings
    nnoremap <silent><buffer><expr> gx
        \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> w
        \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> h defx#do_action('call', 'DefxSmartH')
    nnoremap <silent><buffer><expr> <Left> defx#do_action('call', 'DefxSmartH')
    nnoremap <silent><buffer><expr> l defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> <Right> defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> o defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> <Cr>
        \ defx#is_directory() ?
        \ defx#do_action('open_directory') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> <2-LeftMouse>
        \ defx#is_directory() ? (
            \ defx#is_opened_tree() ?
            \ defx#do_action('close_tree') :
            \ defx#do_action('open_tree')
        \ )
        \ : defx#do_action('drop')
    nnoremap <silent><buffer><expr> sg
        \ defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> sv
        \ defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> st
        \ defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> P
        \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> yy defx#do_action('call', 'DefxYarkPath')
    nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
    nnoremap <silent><buffer> <Home> :call cursor(2, 1)<cr>
    nnoremap <silent><buffer> <End>  :call cursor(line('$'), 1)<cr>
    nnoremap <silent><buffer><expr> > defx#do_action('resize',
        \ defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> < defx#do_action('resize',
        \ defx#get_context().winwidth - 10)
endf
"
" in this function we should vim-choosewin if possible
function! DefxSmartL(_)
    if defx#is_directory()
        call defx#call_action('open_tree')
    else
        let filepath = defx#get_candidate()['action__path']
        call defx#call_action('quit')
        if tabpagewinnr(tabpagenr(), '$') >= 3        " if there are more than 2 normal windows
            if exists(':ChooseWin') == 2
                ChooseWin
            else
                let input = input('ChooseWin No./Cancel(n): ')
                if input ==# 'n' | return | endif
                if input == winnr() | return | endif
                exec input . 'wincmd w'
            endif
            exec 'e' filepath
        else
            exec 'wincmd w'
            exec 'e' filepath
        endif
    endif
endfunction

function! DefxSmartH(_)
    " if cursor line is first line, or in empty dir
    if line('.') ==# 1 || line('$') ==# 1
        return defx#call_action('cd', ['..'])
    endif

    " candidate is opend tree?
    if defx#is_opened_tree()
        return defx#call_action('close_tree')
    endif

    " parent is root?
    let s:candidate = defx#get_candidate()
    let s:parent = fnamemodify(s:candidate['action__path'], s:candidate['is_directory'] ? ':p:h:h' : ':p:h')
    let sep = '/'
    if s:trim_right(s:parent, sep) == s:trim_right(b:defx.paths[0], sep)
        return defx#call_action('cd', ['..'])
    endif

    " move to parent.
    call defx#call_action('search', s:parent)

    " if you want close_tree immediately, enable below line.
    call defx#call_action('close_tree')
endfunction

function! DefxYarkPath(_) abort
    let candidate = defx#get_candidate()
    let @+ = candidate['action__path']
    echo 'yanked: ' . @+
endfunction

function! s:trim_right(str, trim)
    return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction
