local M = {}

M.other = {
	n = {
		["<leader>o"] = { "<cmd> Other <CR>", "other" },
		["<leader>av"] = { "<cmd> OtherVSplit <CR>", "other v split" },
	},
}

M.vim_tmux_navigator = {
	n = {
		["<C-h>"] = { "<cmd>TmuxNavigateLeft<cr>", "Window left" },
		["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>", "Window right" },
		["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>", "Window down" },
		["<C-k>"] = { "<cmd>TmuxNavigateUp<cr>", "Window up" },
	},
	t = {
		["<C-h>"] = { "<C-\\><C-N><C-w>h", "Window left (terminal mode)" },
		["<C-l>"] = { "<C-\\><C-N><C-w>l", "Window right (terminal mode)" },
		["<C-j>"] = { "<C-\\><C-N><C-w>j", "Window down (terminal mode)" },
		["<C-k>"] = { "<C-\\><C-N><C-w>k", "Window up (terminal mode)" },
		["<Esc>"] = { "<C-\\><C-N>", "Exit terminal mode" }, -- Add this line
	},
}

M.general = {
	i = {},
	n = {
		-- overriding base mappings
		-- -- line numbers
		["<leader>n"] = { "<Nop>", "Toggle line number" },
		["<leader>rn"] = { "<Nop>", "Toggle relative number" },
		["<leader>v"] = {
			"<Nop>",
			"New vertical term",
		},
		------------------

		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader><leader>"] = { "<cmd> w <CR>", "save file" },
		["gh"] = { "<C-w>h", "window left" },
		["gl"] = { "<C-w>l", "window right" },
		["gj"] = { "<C-w>j", "window down" },
		["gk"] = { "<C-w>k", "window up" },
		["<leader>cp"] = { '<cmd>:let @+ = substitute(expand("%:p:~:.") , "/", ".", "g")<CR>', "copy file path" },
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

M.test = {
	n = {
		["<leader>t"] = { "<cmd>TestNearest -strategy=harpoon<cr>", "test nearest" },
		["<leader>T"] = { "<cmd>TestFile -strategy=harpoon<cr>", "test file" },
	},
}

M.packer = {
	n = {
		["<leader>ps"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
		["<leader>pS"] = { "<cmd>PackerStatus<cr>", "Packer Status" },
		["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Packer Update" },
	},
}

M.harpoon = {
	n = {
		["<leader>a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
		["<leader>h"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Harpoon Menu" },
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
					"vendor/*",
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
