return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      { import = "lazyvim.plugins.extras.dap.core" }, -- ✅ use LazyVim dap module (fixes setup issue)
      "rcarriga/nvim-dap-ui", -- ✅ dap-ui for sidebar and debug window
    },
    config = function()
      local neotest = require("neotest")
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup dap-ui
      require("dapui").setup({
        layouts = {
          {
            elements = {
              "scopes",
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- width in columns
            position = "left", -- 🡐 this makes it vertical on the left
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 20, -- height in lines
            position = "bottom", -- keep repl + console at bottom
          },
        },
        force_buffers = true, -- this helps in some cases but doesn't guarantee perfect fullscreen
      })

      -- Auto open/close dap-ui when debugging starts/ends
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Neotest setup
      neotest.setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
            pytest_discover_instances = true,
            args = { "--reuse-db" },
          }),
        },
      })

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Neotest keymaps
      map("n", "<leader>tt", function()
        neotest.run.run()
      end, vim.tbl_extend("force", opts, { desc = "Run nearest test" }))

      map("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, vim.tbl_extend("force", opts, { desc = "Run file tests" }))

      map("n", "<leader>td", function()
        neotest.run.run({ strategy = "dap" })
      end, vim.tbl_extend("force", opts, { desc = "Debug nearest test" }))

      map("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, vim.tbl_extend("force", opts, { desc = "Toggle test summary" }))

      map("n", "<leader>to", function()
        neotest.output.open({ enter = true })
      end, vim.tbl_extend("force", opts, { desc = "Open test output" }))

      -- DAP keymaps
      map("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
      map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      map("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
      map("n", "<leader>do", dap.step_out, { desc = "DAP Step Out" })
      map("n", "<leader>ds", dap.step_over, { desc = "DAP Step Over" })
      map("n", "<leader>dq", dap.terminate, { desc = "DAP Terminate" })
      map("n", "<leader>du", dapui.toggle, { desc = "DAP Toggle UI" })
    end,
  },
}
