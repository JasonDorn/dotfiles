return {
	["goolord/alpha-nvim"] = {
		after = "base46",
		disable = false,
		config = function()
			require("plugins.configs.alpha")
		end,
	},
	["nvim-telescope/telescope-fzf-native.nvim"] = {
		run = "make",
	},
	["vim-test/vim-test"] = {},
	["kristijanhusak/vim-create-pr"] = {},
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["williamboman/mason.nvim"] = {
		override_options = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"rubocop",

				-- web dev
				"css-lsp",
				"html-lsp",
				"typescript-language-server",
				"deno",
				"emmet-ls",
				"json-lsp",

				-- shell
				"shfmt",
				"shellcheck",
			},
		},
	},
}
