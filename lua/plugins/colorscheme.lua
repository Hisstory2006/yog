-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function() -- callback function
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
