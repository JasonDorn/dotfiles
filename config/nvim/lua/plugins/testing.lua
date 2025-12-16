return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Adapters for different test frameworks
      "nvim-neotest/neotest-jest",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
          }),
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
        },
        -- UI configuration
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
          open = function()
            vim.cmd("Trouble quickfix")
          end,
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>tt", function()
        require("neotest").run.run()
      end, { desc = "Test: Run nearest" })

      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Test: Run file" })

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Test: Toggle summary" })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true })
      end, { desc = "Test: Show output" })

      vim.keymap.set("n", "<leader>tO", function()
        require("neotest").output_panel.toggle()
      end, { desc = "Test: Toggle output panel" })

      vim.keymap.set("n", "<leader>tS", function()
        require("neotest").run.stop()
      end, { desc = "Test: Stop" })

      vim.keymap.set("n", "[t", function()
        require("neotest").jump.prev({ status = "failed" })
      end, { desc = "Test: Previous failed" })

      vim.keymap.set("n", "]t", function()
        require("neotest").jump.next({ status = "failed" })
      end, { desc = "Test: Next failed" })
    end,
  },
}
