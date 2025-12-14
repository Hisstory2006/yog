return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
						return false
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},

			formatters_by_ft = {
				-- JS/TS
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },

				-- Web
				html = { "biome", "prettier" },
				css = { "biome", "prettier" },
				svelte = { "prettier" },

				-- Data / config
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },

				-- Lua
				lua = { "stylua" },

				-- C/C++
				c = { "clang_format" },
				cpp = { "clang_format" },

				-- Markdown
				markdown = { "prettier", "markdown-toc" },
				-- markdown = { "prettier", "markdownlint-cli2", "markdown-toc" }, -- if you want it
			},
		})

		-- If you REALLY want to force prettier settings globally, keep this.
		-- Otherwise, delete this block and let project .prettierrc win.
		conform.formatters.prettier = {
			args = { "--stdin-filepath", "$FILENAME" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file / selection" })
	end,
}
