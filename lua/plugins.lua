return require("packer").startup(function(use)
	-- Let Packer manage self
	use("wbthomason/packer.nvim")

	-- Misc plugins
	use("junegunn/goyo.vim")
	use("psliwka/vim-smoothie")
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	use("tpope/vim-fugitive")

	-- Pairs
	use("jiangmiao/auto-pairs")
	use("windwp/nvim-ts-autotag")

	-- Navigation
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup()
		end,
	})
	use("justinmk/vim-sneak")

	-- Theme
	use("EdenEast/nightfox.nvim")
  	use("navarasu/onedark.nvim")
	use("itchyny/lightline.vim")

	-- Session management
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				-- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
			})
		end,
	})

	-- Autocomplete
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- Snippets (required for autocomplete)
	use("L3MON4D3/LuaSnip") --snippet engine
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
