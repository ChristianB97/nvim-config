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

vim.keymap.set("n", "<leader>gc", function()
    local handle = io.popen('git status --short')
    local result = handle:read("*a")
    handle:close()

    if result == "" then
        print('No changes ⊙▂⊙) ')
    else
        local commit_msg = vim.fn.input("Commit (☞ﾟヮﾟ)☞ ")
        if commit_msg == "" then
            print("┐(´•_•`)┌ Empty commit message")
        else
            commit_msg = commit_msg:gsub(",%s*", "\n")
            vim.fn.jobstart('git add . && git commit -m ' .. vim.fn.shellescape(commit_msg), {
                on_exit = function(_j, return_val)
                    if return_val == 0 then
                        print("Committed ٩(ˊᗜˋ*)و")
                    else
                        print("(ノಠ益ಠ)ノ彡COMMIT FAILED")
                    end
                end
            })
        end
    end
end)


vim.keymap.set("n", "<leader>gp", function()
    local handle = io.popen('git rev-parse --abbrev-ref HEAD')
    local current_branch = handle:read("*a"):gsub("\n", "")
    handle:close()

    local handle_pushed = io.popen('git log origin/' .. current_branch .. '..' .. current_branch)
    local not_pushed = handle_pushed:read("*a")
    handle_pushed:close()

    if not_pushed == "" then
        print("Nothing to push (≖_≖ )")
        return
    end

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
                print("(ノಠ益ಠ)ノ彡PUSH FAILED")
            end
        end
    })
end)



vim.keymap.set("n", "<leader>gb", function()
    local branch_name = vim.fn.input("New branch (~˘▾˘)~ ")
    if branch_name ~= "" then
        local handle = io.popen('git checkout -b ' .. vim.fn.shellescape(branch_name) .. ' 2>&1')
        local result = handle:read("*a")
        handle:close()
        
        if string.find(result, "Switched to a new branch") then
            print("(･o･)ง Branch created and switched to: " .. branch_name)
        else
            print("(•ิ_•ิ)? Failed to create branch: " .. branch_name)
        end
    else
        print("┐(´•_•`)┌ No branch name provided")
    end
end)

vim.keymap.set("n", "<leader>gs", function()
    local branch_name = vim.fn.input("Goto branch (~˘▾˘)~ ")
    if branch_name ~= "" then
        local handle = io.popen('git checkout ' .. vim.fn.shellescape(branch_name) .. ' 2>&1')
        local result = handle:read("*a")
        handle:close()

        if string.find(result, "Switched to branch") then
            print("(･o･)ง Branch switched to " .. branch_name)
        else
            print("(•ิ_•ิ)? Failed to switch to " .. branch_name)
        end
    else
        print("┐(´•_•`)┌ No branch name provided")
    end
end)
