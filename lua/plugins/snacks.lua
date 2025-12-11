return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true, },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },

    keys = {
      {
        "<leader>lg",
        function() require("snacks").lazygit() end,
        desc = "Open Lazygit",
      },
      {
        "<leader>gl",
        function() require("snacks").lazygit.log() end,
        desc = "Open Lazygit Logs",
      },
      {
        "<leader>es",
        function() require("snacks").explorer() end,
        desc = "Open Snacks Explorer",
      },
      {
        "<leader>rN",
        function() require("snacks").rename.rename_file() end,
        desc = "Fast Rename Current File",
      },
      {
        "<leader>dB",
        function() require("snacks").bufdelete() end,
        desc = "Delete or Close Buffer (Confirm)",
      },
    },

}
}
