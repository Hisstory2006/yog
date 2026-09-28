return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- LSP completion source
		"hrsh7th/cmp-nvim-lsp",

		-- Basic sources
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",

		-- Snippets (optional but useful)
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local has_luasnip, luasnip = pcall(require, "luasnip")

		if has_luasnip then
			require("luasnip.loaders.from_vscode").lazy_load()
		end

		cmp.setup({
			-- Snippet support (safe even if you don’t use snippets yet)
			snippet = {
				expand = function(args)
					if has_luasnip then
						luasnip.lsp_expand(args.body)
					end
				end,
			},

			-- Where completion suggestions come from
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- from LSP servers
				{ name = "buffer" }, -- words in current buffer
				{ name = "path" }, -- file paths
				{ name = "luasnip" }, -- snippets
			}),

			-- Minimal key behavior
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter = accept
				["<C-e>"] = cmp.mapping.abort(), -- close menu
				-- Arrow keys work by default
			}),

			-- Don’t auto-insert text while scrolling
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
		})
	end,
}
