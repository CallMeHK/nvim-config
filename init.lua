require('plugins')
require('maps')
require('theme')
require('tree')

local o = vim.o

-- General settings
o.smartcase = true
o.mouse = false

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- lsp stuff
-- https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/plugins.lua
