return require('packer').startup(function(use)
    -- Let Packer manage self
    use 'wbthomason/packer.nvim'

    -- Simple plugins can be specified as strings
    use 'junegunn/goyo.vim'

    -- Navigation
    use {
      'nvim-telescope/telescope.nvim', 
      tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Theme
    use 'EdenEast/nightfox.nvim'

    -- Session management
    use {
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          log_level = "error",
          -- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        }
      end
    }
end)
