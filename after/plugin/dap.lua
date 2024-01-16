local dap = require('dap')
dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/local/bin/netcoredbg/netcoredbg',
    args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/',
                                'file')
        end
    }
}
vim.api.nvim_set_keymap('n', '<leader>sc',
                        '<Cmd>lua require"dap".continue()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'C-S', '<Cmd>lua require"dap".step_over()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>si',
                        '<Cmd>lua require"dap".step_into()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so',
                        '<Cmd>lua require"dap".step_out()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b',
                        '<Cmd>lua require"dap".toggle_breakpoint()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>B',
                        '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>lp',
                        '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dr',
                        '<Cmd>lua require"dap".repl.open()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dl',
                        '<Cmd>lua require"dap".run_last()<CR>',
                        {noremap = true, silent = true})
