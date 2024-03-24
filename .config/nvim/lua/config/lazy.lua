local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "lukas-reineke/indent-blankline.nvim",
        -- Highlight, edit, and navigate code using a fast incremental parsing library
        "nvim-treesitter/nvim-treesitter",
        -- Additional textobjects for treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "mrcjkb/rustaceanvim",
            version = "^4", -- Recommended
            ft = {"rust"}
        },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                {
                    -- snippet plugin
                    "L3MON4D3/LuaSnip",
                    dependencies = "rafamadriz/friendly-snippets",
                    opts = {history = true, updateevents = "TextChanged,TextChangedI"}
                },
                {
                    "windwp/nvim-autopairs",
                    opts = {
                        fast_wrap = {},
                        disable_filetype = {"TelescopePrompt", "vim"}
                    }
                },
                -- cmp sources plugins
                {
                    "saadparwaiz1/cmp_luasnip",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path"
                }
            }
        },

		{ "catppuccin/nvim", name = "catppuccin", priority = 1000},

        "neovim/nvim-lspconfig",
        require("mason").setup(),
        require("mason-lspconfig").setup(
            {
                ensure_installed = {
                    "volar",
                    "tsserver",
                    "html",
                    "cssls",
                    "omnisharp",
                    "rust_analyzer",
                    "lua_ls"
                }
            }
        )
    },
    {}
)

vim.cmd.colorscheme "catppuccin"