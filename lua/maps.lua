local map = vim.api.nvim_set_keymap
local builtin = require('telescope.builtin')

vim.keymap.set('n', 'e', '<Nop>', { silent = true, remap = false })
vim.g.mapleader = 'e'

options = { noremap = true }

-- General
map('i', 'jk', '<esc>', options)
map('n', '<leader>r', ':so %<CR>', options)

-- Save, Quit
map('n', '<C-s>', ':w<cr>', options)
map('n', '<C-q>', ':q<cr>', options)

-- Navigation
map('n', 'H', '<C-w><C-w>', options)
map('n', 'L', '<C-w>W', options)
map('n', 'J', 'gT', options)
map('n', 'K', 'gt', options)
map('n', '<C-j>', '<C-o>', options)
map('n', '<C-k>', '<C-i>', options)
map('n', 'K', 'gt', options)
map('n', '<leader><leader>t', ':tabnew<cr>', options)
map('n', '<C-n>', ':NvimTreeFindFile<cr>', options)
map('n', '<leader><C-n>', ':NvimTreeOpen<cr>', options)


-- Copy paste (doesnt work in WSL)
map('v', '<C-c>', '"+yi<ESC>', options)

-- Find and Search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- LSP
vim.keymap.set('n', '<leader>ln', ':NullLsInfo<CR>')
vim.keymap.set('n', '<leader><leader>r', ':lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>R', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.cmd('command Err lua vim.diagnostic.setloclist()<CR>')
 -- good info on commands: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
vim.keymap.set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')

-- Completion
-- vim.cmd[[
-- " Use Tab to expand and jump through snippets
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
-- smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
-- 
-- " Use Shift-Tab to jump backwards through snippets
-- imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- ]]
