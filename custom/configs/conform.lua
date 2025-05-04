local conform = require("conform")

conform.setup({
	-- Define your formatters here, keyed by filetype
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" }, -- Use ruff format
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		ruby = { "standardrb" }, -- Or "rubocop" if you prefer
		c = { "clang_format" },
		cpp = { "clang_format" },
		-- Add other filetypes and formatters as needed
	},

	-- Set up format-on-save
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true, -- If no formatter is found, try LSP server
	},

	-- Optional: Customize formatter options if needed
	formatters = {
		ruff_format = {
			-- Inherits Ruff's default command and args, usually fine
			-- You could customize args like this if needed:
			-- args = { "format", "--stdin-filename", "$FILENAME", "-" },
		},
		standardrb = {
			-- command = "bundle", -- Uncomment if you use bundle exec
			-- args = {"exec", "standardrb", "--fix", "--stdin", "$FILENAME"}, -- Adjust args if needed
		},
		-- rubocop = {
		--   command = "bundle", -- Uncomment if you use bundle exec
		--   args = {"exec", "rubocop", "--autocorrect", "--stdin", "$FILENAME"},
		--   stdin = true,
		-- }
	},
})

-- Optional: Add a command to format manually
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count > 0 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	conform.format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
