return {
	"wojciech-kulik/xcodebuild.nvim",
	ft = { "swift", "objc" },
	dependencies = {
		"folke/snacks.nvim", -- picker (you already have it)
		"MunifTanjim/nui.nvim", -- already installed via noice
	},
	config = function()
		require("xcodebuild").setup({})

		local map = vim.keymap.set
		map("n", "<leader>xl", "<cmd>XcodebuildPicker<CR>", { desc = "Xcode actions" })
		map("n", "<leader>xb", "<cmd>XcodebuildBuild<CR>", { desc = "Build project" })
		map("n", "<leader>xr", "<cmd>XcodebuildBuildRun<CR>", { desc = "Build and run" })
		map("n", "<leader>xt", "<cmd>XcodebuildTest<CR>", { desc = "Run tests" })
		map("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<CR>", { desc = "Select device" })
		map("n", "<leader>xs", "<cmd>XcodebuildSetup<CR>", { desc = "Project setup" })
	end,
}
