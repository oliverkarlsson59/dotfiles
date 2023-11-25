print("hello packer")

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	-- Add indentation guides even on blank lines
	use 'lukas-reineke/indent-blankline.nvim'
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use 'nvim-treesitter/nvim-treesitter'
	-- Additional textobjects for treesitter
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			'volar',
			'tsserver',
			'html',
			'cssls',
			'omnisharp',
			'rust_analyzer',
			'lua_ls'
		}
	})


	use {
		"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {}  end
	}
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-vsnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	--use 'navarasu/onedark.nvim'
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			require("rose-pine").setup()
		end
	})

end)
--[[
require('onedark').setup {
	style = 'deep',
	transparent = true
}
require('onedark').load()]]--

require('rose-pine').setup({
	variant = 'moon',
	disable_background = true
}) 


vim.cmd('colorscheme rose-pine')
