function _G.toggle_cheatsheet()
    local bufnr = vim.fn.bufnr('~/.config/nvim/cheatsheet.txt')
    if vim.fn.bufwinnr(bufnr) ~= -1 then
        vim.cmd('bdelete ' .. bufnr)
    else
        vim.cmd('edit ~/.config/nvim/cheatsheet.txt')
    end
end

vim.api.nvim_set_keymap('n', '<leader>-', ':lua toggle_cheatsheet()<CR>',
                        {noremap = true, silent = true})

