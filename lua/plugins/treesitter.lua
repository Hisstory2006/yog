return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  config = function()
    require("nvim-treesitter.configs").setup({

      -- Highlight
      highlight = { enable = true },

      -- Indent
      indent = { enable = true },

      -- Parsers
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "yaml",
        "html",
        "css",
        "python",
        "http",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "java",
        "rust",
        "ron",
      },

      auto_install = true,

      -- Incremental Selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
      },

      textobjects = {

        select = {
          enable = true,
          lookahead = true, -- jumps forward automatically

          keymaps = {
            -- functions
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",

            -- classes
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",

            -- blocks (if/for/while/switch, etc.)
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",

            -- parameters
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
        },

        move = {
          enable = true,
          set_jumps = true,

          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },

          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>sn"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>sp"] = "@parameter.inner",
          },
        },
      },

    })
  end
}
