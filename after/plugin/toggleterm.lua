require'toggleterm'.setup({
    start_in_insert = true,
    direction = "tab",
    shade_terminals = true,
    persist_mode = true,
    winbar = {enabled = false}
});

function _G.execute_term(num, direction)
    vim.cmd("ToggleTerm " .. num .. " size=85 direction=" .. direction)
end

function _G.execute_multiple_terminals(direction, amount)
    for i = 0, amount - 1 do execute_term(i, direction) end
end

for i = 0, 9 do
    vim.api.nvim_set_keymap('n', '\\' .. i,
                            '<cmd>lua execute_term(' .. i .. ', "tab")<CR>',
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '\\v' .. i, '<cmd>lua execute_term(' .. i ..
                                ', "vertical")<CR>',
                            {noremap = true, silent = true})
end

vim.api.nvim_set_keymap('n', '\\\\', ':ToggleTerm<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '\\\\', '<C-\\><C-n>:ToggleTerm<CR>',
                        {noremap = true, silent = true})
