vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- CORE OPTIONS

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
