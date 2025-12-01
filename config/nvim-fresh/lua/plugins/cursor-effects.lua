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

}
