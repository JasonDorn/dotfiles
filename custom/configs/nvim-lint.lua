local lint = require("lint")

lint.linters_by_ft = {
	python = { "flake8" }, -- Keep flake8 if you still want it alongside ruff
	-- Note: Ruff can also do linting. You might want to use *only* ruff eventually.
	-- To use ruff for linting:
	-- python = { "ruff" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	-- ruby = { "rubocop" }, -- Add if you want rubocop linting
	-- Add other filetypes and linters as needed
}

-- Configure nvim-lint diagnostics to run automatically
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

-- Optional: Add commands for manual linting
vim.api.nvim_create_user_command("Lint", function()
	lint.try_lint()
end, {})
