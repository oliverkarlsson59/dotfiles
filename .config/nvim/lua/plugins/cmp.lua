

local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			-- snippet plugin
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" }
		},
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" }
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
}

M.config = function()
		local cmp = require 'cmp'
		cmp.setup {
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.close(),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				['<Tab>'] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
				['<S-Tab>'] = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end,
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			},
		}
end

return M
