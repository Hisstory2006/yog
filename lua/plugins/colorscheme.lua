return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#E6EEF8" })
          vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#5B6078" })
        end,
      })
      vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#E6EEF8" })
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#5B6078" })
    end,
  },
}
