local M = {}

M.general = {
	i = {},
	n = {
		["<leader><leader>"] = { "<cmd> w <CR>", "save file" },
		["gh"] = { "<C-w>h", "window left" },
		["gl"] = { "<C-w>l", "window right" },
		["gj"] = { "<C-w>j", "window down" },
		["gu"] = { "<C-w>k", "window up" },
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
	n = {
		["\\\\"] = { "<cmd> Telescope find_files<CR>", "file finder" },
		["\\f"] = { "<cmd> Telescope live_grep<CR>", "telescope live grep" },
	},
}

M.git = {
	n = {
		["<leader>gc"] = { "<cmd> Telescope git_commits<CR>", "git commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status<CR>", "git status" },
	},
}

return M
