require("plugins")
require("maps")
require("theme")
require("tree")
require("treesitter")
require("lsp")
require("completion")
require("pairs")
require("window")
require("fzf-config")
require("lightline-config")

local o = vim.o

-- General settings
o.smartcase = true
o.mouse = false
vim.cmd("set number")
vim.cmd("set signcolumn=number")
vim.cmd("syntax on")
-- Set tabs to two spaces
vim.cmd("set expandtab")
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- lsp stuff
-- https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/plugins.lua
