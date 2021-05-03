let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'guifgs': ['orange', 'cyan', 'magenta', 'seagreen3'],
    \ 'ctermfgs': ['lightred', 'lightcyan', 'lightmagenta', 'lightgreen'],
    \ 'guis': [''],
    \ 'cterms': [''],
    \ 'operators': '_,_',
    \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \ 'separately': {
        \ 'php': {
            \ 'syn_name_prefix': 'phpBlockRainbow',
            \ 'contains_prefix': '',
            \ 'parentheses': ['start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\[/ end=/\]/ containedin=@htmlPreproc contains=@phpClTop', 'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\v!\z([-_:a-zA-Z0-9]+)(\s+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold contains_prefix=TOP'],
        \ },
        \ 'html': 0,
        \ 'htmldjango': 0,
        \ 'xml': 0,
        \ 'twig': 0,
    \ }
\ }
