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
        return {
          -- Variables
          ["@variable"] = { fg = colors.palette.fujiWhite },
          ["@variable.builtin"] = { fg = colors.palette.oniViolet, italic = true },
          ["@variable.parameter"] = { fg = colors.palette.peachRed },

          -- Functions
          ["@function"] = { fg = colors.palette.crystalBlue, bold = true },
          ["@function.builtin"] = { fg = colors.palette.crystalBlue },
          ["@function.call"] = { fg = colors.palette.crystalBlue },
          ["@function.method"] = { fg = colors.palette.crystalBlue },

          -- Keywords
          ["@keyword"] = { fg = colors.palette.oniViolet, bold = true, italic = true },
          ["@keyword.function"] = { fg = colors.palette.oniViolet, bold = true },
          ["@keyword.operator"] = { fg = colors.palette.boatYellow2 },
          ["@keyword.return"] = { fg = colors.palette.oniViolet, bold = true },

          -- Strings and constants
          ["@string"] = { fg = colors.palette.springGreen },
          ["@number"] = { fg = colors.palette.sakuraPink },
          ["@boolean"] = { fg = colors.palette.surimiOrange, bold = true },
          ["@constant"] = { fg = colors.palette.surimiOrange },
          ["@constant.builtin"] = { fg = colors.palette.surimiOrange, bold = true },

          -- Types
          ["@type"] = { fg = colors.palette.waveAqua2, bold = true },
          ["@type.builtin"] = { fg = colors.palette.waveAqua2 },

          -- Properties and fields
          ["@property"] = { fg = colors.palette.carpYellow },
          ["@field"] = { fg = colors.palette.carpYellow },

          -- Operators
          ["@operator"] = { fg = colors.palette.boatYellow2 },

          -- Punctuation
          ["@punctuation.bracket"] = { fg = colors.palette.springViolet2 },
          ["@punctuation.delimiter"] = { fg = colors.palette.springViolet2 },
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
