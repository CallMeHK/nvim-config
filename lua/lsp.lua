local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "elixirls", "rust_analyzer", "html", "graphql", "cssls" }, -- hls
})

vim.diagnostic.config({ virtual_text = false })

-- lspconfig.hls.setup{
  -- filetypes = { 'haskell', 'lhaskell', 'cabal' },
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.eslint.setup({})

-- deno setup can clash with tsserver
-- nvim_lsp.denols.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json"),
--   init_options = {
--     lint = true,
--   },
-- }

lspconfig.yamlls.setup({})
--  settings = {
--    yaml = {
--      schemas = {
--        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
--        ["../path/relative/to/file.yml"] = "/.github/workflows/*"
--        ["/path/from/root/of/project"] = "/.github/workflows/*"
--      },
--    },
--  }
--}

lspconfig.cssls.setup({
	capabilities = capabilities,
})

lspconfig.html.setup({
	capabilities = capabilities,
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
})

lspconfig.graphql.setup({})

-- Config information: https://sharksforarms.dev/posts/neovim-rust/
lspconfig.rust_analyzer.setup({
	-- on_attach=on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

lspconfig.elixirls.setup({
	on_attach = function(client, bufnr)
		-- client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
	settings = {
		elixirLS = {
			-- I choose to disable dialyzer for personal reasons, but
			-- I would suggest you also disable it unless you are well
			-- aquainted with dialzyer and know how to use it.
			dialyzerEnabled = false,
			-- I also choose to turn off the auto dep fetching feature.
			-- It often get's into a weird state that requires deleting
			-- the .elixir_ls directory and restarting your editor.
			fetchDeps = false,
		},
	},
})

lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
})

lspconfig.tsserver.setup({
	-- uncomment this if using deno
	-- root_dir = nvim_lsp.util.root_pattern("package.json"),
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
})

local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local code_actions = require("null-ls").builtins.code_actions

-- MasonInstall shfmt stylua prettier shellcheck credo eslint

require("null-ls").setup({
	sources = {
		formatting.shfmt, -- shell script formatting
		formatting.stylua, -- lua formatting
		formatting.prettier, -- JS/html formatting
		diagnostics.shellcheck, -- shell script diagnostics
		diagnostics.credo, -- elixir diagnostics
		--		diagnostics.eslint, -- js diagnostics
		code_actions.shellcheck, -- shell script code actions
	},
})
