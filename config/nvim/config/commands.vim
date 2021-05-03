" CoC Format
command! -nargs=0 Format :call CocAction('format')
" Opens FZF + Ripgrep for not ignored files
command! -bang -nargs=* Rg call Rg(v:true, <q-args>, <bang>0)
" Opens FZF + Ripgrep for all files
command! -bang -nargs=* Rgg call Rg(v:false, <q-args>, <bang>0)
" Opens a file searcher
command! -bang -nargs=? -complete=dir Files call Files(<q-args>, <bang>0)
" Opens search of lines in open buffers
command! -bang -nargs=* Lines call Lines(<q-args>, <bang>0)
" Opens buffer search
command! -bar -bang -nargs=? -complete=buffer Buffers call Buffers(<q-args>, <bang>0)
