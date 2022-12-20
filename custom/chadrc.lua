local M = {}
-- local override = require("custom.override")

M.ui = {
    theme = "everforest",
    theme_toggle = { "everforest", "everforest_light" },
}

M.mappings = require("custom.mappings")

-- M.plugins = {
--   user = require("custom.plugins"),
--   override = {
--     ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
--     ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
--     ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
--   },
-- }

return M
