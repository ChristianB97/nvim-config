vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>c", function()
    local handle = io.popen('git status --short')
    local result = handle:read("*a")
    handle:close()

    if result == "" then
        print('No changes ⊙▂⊙) ')
    else
        local commit_msg = vim.fn.input("Commit (☞ﾟヮﾟ)☞ ")
        if commit_msg == "" then
            print("Empty commit message. Commit aborted.")
        else
            commit_msg = commit_msg:gsub(",%s*", "\n")
            vim.fn.jobstart('git add . && git commit -m ' .. vim.fn.shellescape(commit_msg), {
                on_exit = function(_j, return_val)
                    if return_val == 0 then
                        print("Commited ٩(ˊᗜˋ*)و")
                    else
                        print("(ノಠ益ಠ)ノ彡COMMIT FAILED")
                    end
                end
            })
        end
    end
end)


vim.keymap.set("n", "<leader>p", function()
    local check_changes = io.popen('git diff --exit-code')
    local changes = check_changes:read("*a")
    check_changes:close()

    if changes ~= "" then
        print("(≖_≖ ) Nothing commited")
        return
    end

    local handle = io.popen('git rev-parse --abbrev-ref HEAD')
    local current_branch = handle:read("*a"):gsub("\n", "")
    handle:close()

    vim.fn.jobstart('git push origin ' .. current_branch, {
        on_stderr = function(j, data, event)
            local error_msg = data[1]
            if string.match(error_msg, 'has no upstream branch') then
                vim.fn.jobstart('git push --set-upstream origin ' .. current_branch)
            end
        end,
        on_exit = function(j, return_val, event)
            if return_val == 0 then
                print("Pushed ٩( ᐛ )و")
            else
                print("P(ノಠ益ಠ)ノ彡PUSH FAILED")
            end
        end
    })
end)
