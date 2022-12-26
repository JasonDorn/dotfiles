local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd", "tsserver", "eslint" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.solargraph.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		solargraph = {
			commandPath = "/Users/jasondorn/.rbenv/shims/solargraph",
			diagnostics = true,
			completion = true,
		},
	},
})