return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	--vim.cmd.colorscheme "catppuccin"
	config = function()
		require("catppuccin").setup({})
		vim.cmd.colorscheme "catppuccin"
	  end,
}
