-- vim.cmd("colorscheme nightfox")
-- require('onedark').setup {
--     style = 'deep'
-- }
-- require('onedark').load()
local nightfox = require("nightfox")
local transparent = require("transparent")

nightfox.setup({
  options = {
    colorblind = {
      enable = true,
      severity = {
        protan = 0.3,
        deutan = 0.6,
      },
    },
  },
})
vim.cmd("colorscheme carbonfox")
vim.g.lightline = { colorscheme = 'carbonfox' }

transparent.setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("let g:gruvbox_contrast_dark = 'hard'")
