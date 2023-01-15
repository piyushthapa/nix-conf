augroup haskell
  autocmd BufWrite *.hs :Autoformat
  autocmd FileType haskell set expandtab
  autocmd FileType haskell set tabstop=2
  autocmd FileType haskell set softtabstop=2
  autocmd FileType haskell set shiftwidth=2
augroup END
