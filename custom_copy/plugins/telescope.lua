local present, telescope = pcall(require, "telescope")

if not present then
	return
end

local options = {
	extensions_list = { "themes", "terms", "fzf" },
}

-- Ignore patterns for live_grep
local live_grep_ignore_patterns = { "*.svg", "*.jpg", "*.png" }

-- Ignore patterns for find_files
local find_files_ignore_patterns = { "*.svg", "*.jpg", "*.png", "spec/fixtures/vcr_cassettes/*", "node_modules/*" }

-- Custom live_grep function
local function custom_live_grep()
	telescope.live_grep({
		-- Set ignore patterns for live_grep
		file_ignore_patterns = live_grep_ignore_patterns,
		-- Additional options if needed
	})
end

-- Custom find_files function
local function custom_find_files()
	telescope.find_files({
		-- Set ignore patterns for find_files
		file_ignore_patterns = find_files_ignore_patterns,
		-- Additional options if needed
	})
end

-- load extensions
pcall(function()
	for _, ext in ipairs(options.extensions_list) do
		telescope.load_extension(ext)
	end
end)

return {
	custom_live_grep = custom_live_grep,
	custom_find_files = custom_find_files,
}
