return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install({
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "json",
      "yaml",
      "c",
      "rust",
      "go",
      "java",
    })
  end,
}
