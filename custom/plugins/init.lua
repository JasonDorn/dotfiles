return {
	["goolord/alpha-nvim"] = {
		after = "base46",
		disable = false,
		config = function()
			require("plugins.configs.alpha")
		end,
	},
	["nvim-telescope/telescope.nvim"] = {
		cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
			require("custom.plugins.telescope")
		end,
		setup = function()
			require("core.utils").load_mappings("telescope")
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
	["neovim/nvim-lspconfig"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("nvim-lspconfig")
		end,
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["kristijanhusak/vim-create-pr"] = {},
	["rgroli/other.nvim"] = {
		config = function()
			require("other-nvim").setup({
				mappings = {
					-- builtin mappings
					"rails",
					-- custom mapping
					{
						pattern = "/(.*)/(.*)/.*.jsx$",
						target = {
							{
								target = "/%1/%2/%2.test.jsx",
								context = "test",
							},
							{
								target = "/%1/%2/%2.test.js",
								context = "test",
							},
						},
					},
					{
						pattern = "/(.*)/(.*)/.*.js$",
						target = {
							{
								target = "/%1/%2/%2.test.jsx",
								context = "test",
							},
							{
								target = "/%1/%2/%2.test.js",
								context = "test",
							},
						},
					},
				},
				transformers = {
					-- defining a custom transformer
					lowercase = function(inputString)
						return inputString:lower()
					end,
				},
				style = {
					-- How the plugin paints its window borders
					-- Allowed values are none, single, double, rounded, solid and shadow
					border = "solid",

					-- Column seperator for the window
					seperator = "|",

					-- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
					width = 0.7,

					-- min height in rows.
					-- when more columns are needed this value is extended automatically
					minHeight = 2,
				},
			})
		end,
	},
}
