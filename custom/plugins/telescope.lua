local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local options = {
  extensions_list = { "themes", "terms", "fzf" },
}

-- load extensions
pcall(function()
  for _, ext in ipairs(options.extensions_list) do
    telescope.load_extension(ext)
  end
end)
