-- Set my preferred leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Give line length indicator
vim.o.cc = '80,120'

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching
vim.o.ignorecase = true

-- no tabs only spaces
vim.o.expandtab = true
vim.o.autoindent = true

-- tabs are 2 spaces
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- vim.o.foldlevel = 3
-- vim.o.foldmethod = "syntax"
