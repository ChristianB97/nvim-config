require'toggleterm'.setup({
    start_in_insert = true,
    direction = "tab",
    shade_terminals = true,
    persist_mode = true
});

function _G.execute_term(num) require("toggleterm").exec("", num) end
vim.api.nvim_set_keymap('n', '\\1', '<cmd>lua execute_term(1)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\2', '<cmd>lua execute_term(2)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\3', '<cmd>lua execute_term(3)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\4', '<cmd>lua execute_term(4)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\5', '<cmd>lua execute_term(5)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\6', '<cmd>lua execute_term(6)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\7', '<cmd>lua execute_term(7)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\8', '<cmd>lua execute_term(8)<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\9', '<cmd>lua execute_term(9)<CR>',
                        {noremap = true, silent = true})
-- continue as needed up to '\\9'

-- For 10th terminal, use 0 as shortcut
vim.api.nvim_set_keymap('n', '\\0', '<cmd>lua execute_term(10)<CR>',
                        {noremap = true, silent = true})

--- To make \\ close the current terminal regardless of the mode
vim.api.nvim_set_keymap('n', '\\\\', ':ToggleTerm<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '\\\\', '<C-\\><C-n>:ToggleTerm<CR>',
                        {noremap = true, silent = true})
