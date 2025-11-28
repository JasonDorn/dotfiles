return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = { bold = true },
      keywordStyle = { italic = true, bold = true },
      statementStyle = { bold = true },
      typeStyle = { bold = true },
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          ["@variable"] = { fg = colors.palette.fujiWhite },
          ["@variable.builtin"] = { fg = colors.palette.oniViolet },
          ["@function"] = { fg = colors.palette.crystalBlue, bold = true },
          ["@function.call"] = { fg = colors.palette.crystalBlue },
          ["@keyword"] = { fg = colors.palette.oniViolet, bold = true },
          ["@keyword.function"] = { fg = colors.palette.oniViolet },
          ["@string"] = { fg = colors.palette.springGreen },
          ["@number"] = { fg = colors.palette.sakuraPink },
          ["@boolean"] = { fg = colors.palette.surimiOrange },
          ["@type"] = { fg = colors.palette.waveAqua2, bold = true },
          ["@parameter"] = { fg = colors.palette.peachRed },
          ["@property"] = { fg = colors.palette.carpYellow },
        }
      end,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "kanagawa",
      },
    },
  },
}
