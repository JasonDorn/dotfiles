return {
  -- Trouble.nvim - Better diagnostics and quickfix list
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      use_diagnostic_signs = true,
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- nvim-surround - Manipulate surrounding characters
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- todo-comments.nvim - Highlight TODO/FIXME/NOTE comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      colors = {
        error = { "#e82424" }, -- Kanagawa red
        warning = { "#ff9e3b" }, -- Kanagawa orange
        info = { "#7fb4ca" }, -- Kanagawa light blue
        hint = { "#98bb6c" }, -- Kanagawa green
        default = { "#7e9cd8" }, -- Kanagawa blue
        test = { "#d27e99" }, -- Kanagawa pink
      },
    },
    keys = {
      {
        "<leader>ft",
        "<cmd>TodoTelescope<cr>",
        desc = "Find TODOs",
      },
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next TODO",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous TODO",
      },
    },
  },

  -- indent-blankline.nvim - Colorful indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = true,
        highlight = { "Function", "Label" },
        priority = 500,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  -- nvim-spectre - Project-wide search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Spectre",
    opts = {
      open_cmd = "vnew",
    },
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Replace current word (Spectre)",
      },
      {
        "<leader>sf",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Replace in current file (Spectre)",
      },
    },
  },

  -- git-conflict.nvim - Inline merge conflict resolution
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = "copen", -- command or function to open the conflicts list
        highlights = {
          incoming = "DiffAdd",
          current = "DiffText",
        },
      })
    end,
    keys = {
      {
        "<leader>gco",
        "<cmd>GitConflictChooseOurs<cr>",
        desc = "Choose Ours (Git Conflict)",
      },
      {
        "<leader>gct",
        "<cmd>GitConflictChooseTheirs<cr>",
        desc = "Choose Theirs (Git Conflict)",
      },
      {
        "<leader>gcb",
        "<cmd>GitConflictChooseBoth<cr>",
        desc = "Choose Both (Git Conflict)",
      },
      {
        "<leader>gc0",
        "<cmd>GitConflictChooseNone<cr>",
        desc = "Choose None (Git Conflict)",
      },
      {
        "[x",
        "<cmd>GitConflictPrevConflict<cr>",
        desc = "Previous Conflict",
      },
      {
        "]x",
        "<cmd>GitConflictNextConflict<cr>",
        desc = "Next Conflict",
      },
      {
        "<leader>gcl",
        "<cmd>GitConflictListQf<cr>",
        desc = "List Conflicts",
      },
    },
  },
}
