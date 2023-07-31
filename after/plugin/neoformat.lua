vim.cmd([[
augroup fmt
  autocmd!
  silent! autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
