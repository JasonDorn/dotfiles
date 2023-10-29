local M = {}

M.other = {
	n = {
		["<leader>o"] = { "<cmd> Other <CR>", "other" },
		["<leader>av"] = { "<cmd> OtherVSplit <CR>", "other v split" },
	},
}

M.general = {
	i = {},
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader><leader>"] = { "<cmd> w <CR>", "save file" },
		-- ["<leader><leader>"] = { "<cmd> w <CR> <cmd> EslintFixAll <CR>", "save file" },
		["gh"] = { "<C-w>h", "window left" },
		["gl"] = { "<C-w>l", "window right" },
		["gj"] = { "<C-w>j", "window down" },
		["gu"] = { "<C-w>k", "window up" },
		["<leader>cp"] = { '<cmd>:let @+ = expand("%")<CR>', "copy file path" },
		["<leader>b"] = { "<Nop>", "no op" },
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

M.test = {
	n = {
		["<leader>t"] = { "<cmd>TestNearest -strategy=neovim --format documentation<cr>", "test nearest" },
		["<leader>T"] = { "<cmd>TestFile -strategy=neovim --format documentation<cr>", "test file" },
	},
}

M.packer = {
	n = {
		["<leader>ps"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
		["<leader>pS"] = { "<cmd>PackerStatus<cr>", "Packer Status" },
		["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Packer Update" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		["\\\\"] = { "<cmd> Telescope find_files<CR>", "file finder" },
		["\\f"] = { "<cmd> Telescope live_grep<CR>", "telescope live grep" },
		["<leader>fw"] = {
			string.format(
				"<cmd>lua require('telescope.builtin').live_grep({ file_ignore_patterns = %s })<CR>",
				vim.inspect({ "*.svg", "*.jpg", "*.png", "yarn.lock" })
			),
			"live grep",
		},
		["<leader>ff"] = {
			string.format(
				"<cmd>lua require('telescope.builtin').find_files({ file_ignore_patterns = %s })<CR>",
				vim.inspect({
					"*.svg",
					"*.jpg",
					"*.png",
					"spec/fixtures/vcr_cassettes/*",
					"node_modules/*",
					"yarn.lock",
				})
			),
			"find files",
		},
	},
}

M.git = {
	n = {
		["<leader>gc"] = { "<cmd> Telescope git_commits<CR>", "git commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status<CR>", "git status" },
	},
}

return M
