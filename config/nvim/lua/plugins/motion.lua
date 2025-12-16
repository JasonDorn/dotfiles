return {
  -- Flash.nvim - Enhanced motion with beautiful labels
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      -- Labels that appear on jump targets
      labels = "asdfghjklqwertyuiopzxcvbnm",
      -- Use uppercase for less common jumps
      search = {
        multi_window = true,
        forward = true,
        wrap = true,
        mode = "exact", -- exact, search, fuzzy
      },
      jump = {
        jumplist = true,
        pos = "start", -- start, end, range
        history = false,
        register = false,
        nohlsearch = false,
        autojump = false,
      },
      label = {
        uppercase = true,
        rainbow = {
          enabled = true,
          shade = 5,
        },
      },
      modes = {
        search = {
          enabled = true, -- Enhanced search
        },
        char = {
          enabled = true,
          jump_labels = true,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
