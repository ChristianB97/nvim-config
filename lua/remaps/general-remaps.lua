vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s",
               [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})

vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-w>', '<C-w>w', {silent = true, noremap = true})
vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n><C-w>w',
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

vim.api.nvim_set_keymap('n', '<c-h>', ':bprev<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', ':bnext<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-j>', ']m', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '[m', {noremap = true})
