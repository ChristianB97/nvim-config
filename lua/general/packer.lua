vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = {{"nvim-lua/plenary.nvim"}}
    })
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function() vim.cmd("colorscheme rose-pine") end
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true
            })
            ts_update()
        end
    })

    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"}, {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"}, {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"}, {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"}, {"hrsh7th/cmp-cmdline"},
            {"L3MON4D3/LuaSnip"}, {"rafamadriz/friendly-snippets"}
        }
    })
    use("sbdchd/neoformat")
    use {"akinsho/toggleterm.nvim", tag = '*'}
    use("tpope/vim-eunuch")
    use("tpope/vim-surround")
    use("phaazon/hop.nvim")
    use("stevearc/oil.nvim")
    use("olekatpyle/xunit.nvim")
    use("nvim-tree/nvim-web-devicons")
    use('mfussenegger/nvim-dap')
end)
