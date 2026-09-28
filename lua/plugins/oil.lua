return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		default_file_explorer = true,
		columns = { "icon" },

		-- Keymaps inside the Oil window
		keymaps = {
			["<C-c>"] = false, -- don't close with Ctrl-C
			["<C-h>"] = false,
			["<C-l>"] = false,
			["<C-r>"] = "actions.refresh",
			["<C-s>"] = { "actions.select", opts = { horizontal = true } },
			["q"] = "actions.close", -- quit Oil with q
		},

		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			natural_order = "fast",
		},
	},

	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)

		-- Keymaps for opening Oil (outside the Oil buffer)
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
			desc = "Open parent directory with Oil",
		})

		vim.keymap.set("n", "<leader>-", oil.toggle_float, {
			desc = "Toggle floating Oil",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})
	end,
}
