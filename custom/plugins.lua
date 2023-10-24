local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{ "vim-test/vim-test", ft = "ruby" },
	{ "tpope/vim-repeat", lazy = false },
	{ "tpope/vim-rhubarb", lazy = false },
	{ "tpope/vim-fugitive", lazy = false },
	{ "tpope/vim-rails", lazy = false },
	{ "tpope/vim-endwise", lazy = false },
	{ "tpope/vim-surround", lazy = false },
	{ "rhysd/committia.vim", lazy = false },
	{ "terryma/vim-multiple-cursors", lazy = false },
	{ "matze/vim-move", lazy = false },
	{ "kristijanhusak/vim-create-pr", lazy = false },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavor = "latte",
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
		end,
	},
	{
		"phaazon/hop.nvim",
		lazy = false,
		branch = "v2",
		config = function()
			require("custom.configs.hop")
		end,
	},

	{ "junegunn/fzf", lazy = false, run = ":call fzf#install()" },
	{ "junegunn/fzf.vim", lazy = false },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },

	{
		"rgroli/other.nvim",
		ft = "ruby",
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

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
