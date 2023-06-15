local present, utils = pcall(require, "core.utils")
if not present then
    return
end

utils.nmap("<leader>up", ":PackerUpdate<CR>")

local function ensure_packer()
    local fn = vim.fn
    local install_path = fn.stdpath("data")
        .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) <= 0 then
        return false
    end

    fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    vim.cmd([[
    packadd packer.nvim
    ]])

    return true
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Autocompletion/snippets
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.cmp")
        end,
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
        },
    }

    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
        },
        opts = {
            history = true,
            updateevents = "TextChanged,TextChangedI",
        },
    }

    -- Language servers and formatters
    use {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.mason")
        end,
        run = ":MasonUpdate",
    }

    -- LSP support
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lspconfig")
        end,
    }

    -- OneDark theme
    use {
        "navarasu/onedark.nvim",
        config = function()
            require("plugins.onedark")
        end,
    }

    -- Searching
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        config = function()
            require("plugins.telescope")
        end,
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    -- Syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.treesitter")
        end,
        run = function()
            local ts_update = require("nvim-treesitter.install")
                .update({ with_sync = true })
            ts_update()
        end,
    }

    -- File tree
    use {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("plugins.nvim_tree")
        end,
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
