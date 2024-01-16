vim.api.nvim_exec([[
  augroup fmt
    autocmd!
    autocmd BufWritePre * silent! undojoin | execute 'Neoformat'
  augroup END

]], false)

