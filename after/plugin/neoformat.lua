vim.cmd([[
augroup fmt
  autocmd!
    autocmd BufWritePre * if exists(':Neoformat') | silent! undojoin | Neoformat | endif
augroup END
]])
