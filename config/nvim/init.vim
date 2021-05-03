let g:netrw_liststyle=3
let loaded_netrwPlugin = 1

let g:polyglot_disabled = ['markdown', 'scss', 'tex',]

let g:config_root = stdpath('config')
let g:config_files = globpath(g:config_root, 'config/*.vim', 0, 1)
                    \ + globpath(g:config_root, 'config/plugins-config/*.vim', 0, 1)

for f in g:config_files
  execute 'source ' . f
endfor
