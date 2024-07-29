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
		{
			import = "plugins"
		},


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
			ft = { "rust" }
		},




		"neovim/nvim-lspconfig",
	},
	{}
)
