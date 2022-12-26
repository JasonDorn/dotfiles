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
	["nvim-pack/nvim-spectre"] = {},
	["antoinemadec/FixCursorHold.nvim"] = {},
	["nvim-neotest/neotest"] = {},
	["phaazon/hop.nvim"] = {
		branch = "v2",
		config = function()
			require("custom.plugins.hop")
		end,
	},
	["tpope/vim-repeat"] = {},
	["tpope/vim-rhubarb"] = {},
	["tpope/vim-fugitive"] = {},
	["tpope/vim-bundler"] = {},
	["tpope/vim-rails"] = {},
	["tpope/vim-endwise"] = {},
	["tpope/vim-surround"] = {},
	["matze/vim-move"] = {},
	["rhysd/committia.vim"] = {},
	["terryma/vim-multiple-cursors"] = {},
	-- ["neovim/nvim-lspconfig"] = {
	-- 	opt = true,
	-- 	setup = function()
	-- 		require("core.lazy_load").on_file_open("nvim-lspconfig")
	-- 	end,
	-- 	config = function()
	-- 		require("plugins.configs.lspconfig")
	-- 		require("custom.plugins.lspconfig")
	-- 	end,
	-- },
}
