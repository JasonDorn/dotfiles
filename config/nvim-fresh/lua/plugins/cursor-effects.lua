return {
  -- Smear cursor - Creates a trailing effect when cursor moves
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      cursor_color = "#d27e99",
      normal_bg = "#1f1f28",
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      use_floating_windows = true,
      legacy_computing_symbols_support = false,
      hide_target_hack = true,
    },
  },

  -- Mini.animate - Smooth scrolling and animations
  {
    "nvim-mini/mini.animate",
    event = "VeryLazy",
    config = function()
      local animate = require("mini.animate")
      animate.setup({
        -- Cursor path - disabled since we're using smear-cursor
        cursor = {
          enable = false,
        },
        -- Vertical scroll
        scroll = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
        -- Window resize
        resize = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        },
        -- Window open/close
        open = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
        close = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
      })
    end,
  },

  -- Scrollbar with decorations
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup({
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        handle = {
          text = " ",
          color = "#7e9cd8", -- Kanagawa blue
          hide_if_all_visible = true,
        },
        marks = {
          Cursor = {
            text = "•",
            priority = 0,
            color = "#d27e99", -- Kanagawa pink
          },
          Search = {
            text = { "-", "=" },
            priority = 1,
            color = "#e6c384", -- Kanagawa yellow
          },
          Error = {
            text = { "-", "=" },
            priority = 2,
            color = "#e82424", -- Kanagawa red
          },
          Warn = {
            text = { "-", "=" },
            priority = 3,
            color = "#ff9e3b", -- Kanagawa orange
          },
          Info = {
            text = { "-", "=" },
            priority = 4,
            color = "#7fb4ca", -- Kanagawa light blue
          },
          Hint = {
            text = { "-", "=" },
            priority = 5,
            color = "#98bb6c", -- Kanagawa green
          },
          Misc = {
            text = { "-", "=" },
            priority = 6,
            color = "#938aa9", -- Kanagawa purple
          },
          GitAdd = {
            text = "│",
            priority = 7,
            color = "#98bb6c", -- Kanagawa green
          },
          GitChange = {
            text = "│",
            priority = 7,
            color = "#7fb4ca", -- Kanagawa light blue
          },
          GitDelete = {
            text = "_",
            priority = 7,
            color = "#e82424", -- Kanagawa red
          },
        },
        excluded_buftypes = {
          "terminal",
        },
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
          "noice",
          "neo-tree",
        },
        autocmd = {
          render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
          },
        },
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = true,
          handle = true,
          search = true,
        },
      })
    end,
  },
}
