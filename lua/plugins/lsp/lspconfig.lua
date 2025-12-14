return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- Minimal LSP keybinds (buffer-local)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspMinimal", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Hover documentation
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- Go to definition
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      end,
    })

    -- Diagnostics UI (quiet + standard)
    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰠠 ",
      [vim.diagnostic.severity.INFO]  = " ",
    }

    vim.diagnostic.config({
      signs = { text = signs },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
    })

    -- Capabilities for nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Enable servers (configs assumed elsewhere or default)
    vim.lsp.enable("clangd")               -- C/C++
    vim.lsp.enable("ts_ls")                -- TS + JS + TSX/JSX
    vim.lsp.enable("html")                 -- HTML
    vim.lsp.enable("cssls")                -- CSS
    vim.lsp.enable("emmet_language_server")-- Emmet abbreviations
    vim.lsp.enable("tailwindcss")
  end,
}
