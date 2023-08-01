vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
vim.api.nvim_set_keymap('n', '<Leader>gw', ':Git blame<CR>',
                        {noremap = true, silent = true})
