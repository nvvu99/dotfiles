augroup General
  autocmd!
  " Put the quickfix window always at the bottom
  autocmd! FileType qf call OpenQuickFix()
  " Enable text file settings
  autocmd! FileType markdown,txt,tex call EnableTextFileSettings()
  autocmd! FileType fzf call OnFZFOpen()
  " autocmd! VimLeavePre * call DisableDistractionFreeSettings()
augroup END

augroup TermHandling
  autocmd!
  if has('nvim')
    autocmd! TermOpen * let g:last_open_term_id = b:terminal_job_id
  endif
augroup END

augroup fmt
  autocmd!
  autocmd BufWritePre * Autoformat
  " autocmd BufWritePre *.php Format
augroup END

autocmd BufEnter * let &titlestring = expand("%:t")
