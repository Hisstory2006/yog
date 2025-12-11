-----------------------------------------------------------
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- CORE OPTIONS
-----------------------------------------------------------

-- UI / VISUALS
vim.opt.number       = true   -- line numbers
vim.opt.relativenumber = true -- relative numbers
vim.opt.cursorline   = true   -- highlight current line
vim.opt.termguicolors = true  -- true color support
vim.opt.wrap         = false  -- disable line wrapping
vim.opt.scrolloff    = 8      -- vertical scroll padding
vim.opt.signcolumn   = "yes"  -- prevent text shifting when signs appear

-- TIMING / PERFORMANCE
vim.opt.updatetime   = 50     -- faster CursorHold & diagnostics updates

-- EDITORCONFIG SUPPORT
vim.g.editorconfig   = true   -- respect .editorconfig files in projects

-- SPLITS BEHAVIOR
vim.opt.splitbelow   = true   -- horizontal splits open below
vim.opt.splitright   = true   -- vertical splits open to the right

-- INDENTATION / TABS
vim.opt.expandtab    = true   -- convert tabs to spaces
vim.opt.autoindent   = true   -- auto indentation
vim.opt.smartindent  = true  -- auto-indent using simple C-like rules
vim.opt.tabstop      = 2      -- number of spaces per tab
vim.opt.shiftwidth   = 2      -- number of spaces for indentation

-- SEARCH
vim.opt.ignorecase   = true   -- case-insensitive search
vim.opt.smartcase    = true   -- but case-sensitive if capital letter exists
vim.opt.incsearch    = true   -- incremental search results
vim.opt.hlsearch     = true   -- highlight all matches

-- COMMAND PREVIEW
vim.opt.inccommand   = "split" -- live substitution preview

-- CLIPBOARD
vim.opt.clipboard    = "unnamedplus" -- use system clipboard

-- MOUSE
vim.opt.mouse        = "a"     -- enable mouse support

-- ADVANCED BEHAVIOR
vim.opt.virtualedit  = "block" -- allow cursor to move through visual block gaps

-----------------------------------------------------------
-- AUTOCMDS
-----------------------------------------------------------

-- Highlight text briefly after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-----------------------------------------------------------
-- KEYMAPS: MOVEMENT & SEARCH
-----------------------------------------------------------

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down", noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up",   noremap = true, silent = true })

-- Half-page jump with cursor centered
map("n", "<C-d>", "<C-d>zz", { desc = "Move down half page and center cursor", noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Move up half page and center cursor",   noremap = true, silent = true })

-- Next/previous search result centered
map("n", "n", "nzzzv", { desc = "Next search result centered",     noremap = true, silent = true })
map("n", "N", "Nzzzv", { desc = "Previous search result centered", noremap = true, silent = true })

-- Clear search highlight
map("n", "<leader>l", ":nohl<CR>", { desc = "Clear search highlight", noremap = true, silent = true })

-----------------------------------------------------------
-- KEYMAPS: INDENTING & EDITING
-----------------------------------------------------------

-- Keep selection when shifting indent in visual mode
map("v", "<", "<gv", { desc = "Indent left and keep selection",  noremap = true, silent = true })
map("v", ">", ">gv", { desc = "Indent right and keep selection", noremap = true, silent = true })

-- Delete character without yanking it
map("n", "x", '"_x', {
  desc   = "Delete character without copying to clipboard",
  noremap = true,
  silent  = true,
})

-- Global substitute of word under cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "Replace word under cursor globally",
  noremap = true,
  silent = true,
})

-----------------------------------------------------------
-- KEYMAPS: CLIPBOARD / DELETE / PASTE
-----------------------------------------------------------

-- Paste in visual mode without overwriting clipboard
map("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard", noremap = true, silent = true })

-- Delete without yanking (normal + visual)
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking", noremap = true, silent = true })

-- Better paste in visual mode (do not clobber register)
map("v", "p", '"_dP', { desc = "Better paste in visual mode", noremap = true, silent = true })

-----------------------------------------------------------
-- KEYMAPS: TABS
-----------------------------------------------------------

-- Open a new empty tab
map("n", "<leader>to", "<cmd>tabnew<CR>", {
  desc = "Open new tab",
  noremap = true,
  silent = true,
})

-- Close current tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", {
  desc = "Close current tab",
  noremap = true,
  silent = true,
})

-- Go to next / previous tab
map("n", "<leader>tn", "<cmd>tabnext<CR>", {
  desc = "Go to next tab",
  noremap = true,
  silent = true,
})
map("n", "<leader>tp", "<cmd>tabprevious<CR>", {
  desc = "Go to previous tab",
  noremap = true,
  silent = true,
})

-- Open the current buffer in a new tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", {
  desc = "Open current buffer in new tab",
  noremap = true,
  silent = true,
})

-----------------------------------------------------------
-- KEYMAPS: SPLIT WINDOWS
-----------------------------------------------------------

-- Split window vertically / horizontally
map("n", "<leader>sv", "<C-w>v", {
  desc = "Split window vertically",
  noremap = true,
  silent = true,
})
map("n", "<leader>sh", "<C-w>s", {
  desc = "Split window horizontally",
  noremap = true,
  silent = true,
})

-- Make all splits equal size
map("n", "<leader>se", "<C-w>=", {
  desc = "Make splits equal size",
  noremap = true,
  silent = true,
})

-- Close current split
map("n", "<leader>sx", "<cmd>close<CR>", {
  desc = "Close current split",
  noremap = true,
  silent = true,
})

-----------------------------------------------------------
-- KEYMAPS: FILE UTILITIES
-----------------------------------------------------------

-- Copy current file path to system clipboard
map("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~")        -- file path relative to home directory
  vim.fn.setreg("+", filePath)                 -- copy to system clipboard
  print("File path copied to clipboard: " .. filePath)
end, {
  desc = "Copy file path to clipboard",
  noremap = true,
  silent = true,
})
