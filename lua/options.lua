vim.g.mapleader = " "

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.rnu = true

vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.o.clipboard = "unnamedplus"

-- add binaries installed by mason.nvim to PATH (otherwise lazy loaded)
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
