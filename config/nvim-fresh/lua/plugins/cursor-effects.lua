return {
  -- Smear cursor - Creates a trailing effect when cursor moves
  {
    "sphrase/smear-cursor.nvim",
    opts = {
      -- Smear cursor color. Defaults to Cursor GUI color
      cursor_color = "#d27e99",

      -- Background color. Defaults to Normal GUI background color
      normal_bg = "#1f1f28",

      -- Smear cursor when switching buffers or windows
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines
      smear_between_neighbor_lines = true,

      -- Use floating windows to display smears outside buffers.
      use_floating_windows = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      legacy_computing_symbols_support = false,

      -- Attempt to hide the real cursor when smearing
      hide_target_hack = true,
    },
  },

  -- Specs.nvim - Pulse effect on cursor jumps (complements smear-cursor)
  {
    "edluffy/specs.nvim",
    event = "VeryLazy",
    config = function()
      require("specs").setup({
        show_jumps = true,
        min_jump = 10, -- Only show for jumps of 10+ lines
        popup = {
          delay_ms = 0,
          inc_ms = 5,
          blend = 10,
          width = 20,
          winhl = "PMenu",
          fader = require("specs").pulse_fader,
          resizer = require("specs").shrink_resizer,
        },
        ignore_filetypes = {},
        ignore_buftypes = {
          nofile = true,
        },
      })
    end,
  },
}
