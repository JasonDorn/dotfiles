return {
  -- Harpoon - Quick file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- Basic keymaps
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Harpoon: Add file" })

      vim.keymap.set("n", "<leader>h", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon: Toggle menu" })

      -- Quick navigation to specific files
      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon: File 1" })
      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon: File 2" })
      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon: File 3" })
      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon: File 4" })

      -- Cycle through harpoon list
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end, { desc = "Harpoon: Previous" })
      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end, { desc = "Harpoon: Next" })
    end,
  },

  -- Other.nvim - Switch between related files (test/implementation)
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          -- Ruby on Rails
          {
            pattern = "/app/(.*)/(.*).rb$",
            target = "/spec/%1/%2_spec.rb",
            context = "spec",
          },
          {
            pattern = "/spec/(.*)/(.*).rb$",
            target = "/app/%1/%2.rb",
            context = "implementation",
          },
          -- JavaScript/TypeScript
          {
            pattern = "/(.*)/(.*).ts$",
            target = "/%1/%2.spec.ts",
            context = "spec",
          },
          {
            pattern = "/(.*)/(.*).spec.ts$",
            target = "/%1/%2.ts",
            context = "implementation",
          },
          {
            pattern = "/(.*)/(.*).tsx$",
            target = "/%1/%2.spec.tsx",
            context = "spec",
          },
          {
            pattern = "/(.*)/(.*).spec.tsx$",
            target = "/%1/%2.tsx",
            context = "implementation",
          },
          -- Add more patterns as needed
        },
      })

      vim.keymap.set("n", "<leader>o", "<cmd>Other<CR>", { desc = "Other: Switch to related file" })
      vim.keymap.set("n", "<leader>av", "<cmd>OtherVSplit<CR>", { desc = "Other: Open in vsplit" })
    end,
  },
}
