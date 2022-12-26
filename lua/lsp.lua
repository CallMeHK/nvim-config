local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "tsserver" },
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

require("null-ls").setup({
	sources = {
		formatting.shfmt, -- shell script formatting
		formatting.stylua, -- shell script formatting
		formatting.prettier, -- markdown formatting
		diagnostics.shellcheck, -- shell script diagnostics
		-- diagnostics.tsc,
		-- diagnostics.eslint,
		code_actions.shellcheck, -- shell script code actions
	},
})

