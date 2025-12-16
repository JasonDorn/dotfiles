return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    config = function()
      require("smear_cursor").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
  },
  { "tpope/vim-rails" },
  { "tpope/vim-projectionist" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = function()
      -- create build dir, run cmake & make, then cleanup
      vim.fn.mkdir("build", "p")
      vim.cmd "!cd build && cmake -DCMAKE_BUILD_TYPE=Release .."
      vim.cmd "!cd build && make"
      vim.cmd "!cp build/libtelescope-fzf-native.so ."
      vim.fn.rmdir("build", "rf")
    end,
    cond = function()
      -- only try if cmake is installed
      return vim.fn.executable "cmake" == 1
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy", -- lazy‑load on idle
    config = function()
      require("harpoon").setup {
        -- any custom options here
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- optional: basic keymaps or setup can go here
    end,
  },

  -- ✅ Neotest plugin with Python adapter
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio", -- ← add this line
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
            runner = "pytest",
            -- these args apply to every test run:
            args = {
              "--maxfail=0",
              "--disable-warnings",
              "--reuse-db",
            },
          },
        },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
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
}
