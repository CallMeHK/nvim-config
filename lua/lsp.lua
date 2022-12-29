local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "tsserver", "elixirls", "rust_analyzer", "html", "graphql", "cssls" },
})

vim.diagnostic.config({ virtual_text = false })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

lspconfig.sumneko_lua.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
})

lspconfig.tsserver.setup({
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
		diagnostics.eslint, -- js diagnostics
		code_actions.shellcheck, -- shell script code actions
	},
})
