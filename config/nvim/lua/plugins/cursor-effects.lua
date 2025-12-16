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
}
