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

  -- vim-projectionist - Switch between related files (test/implementation, Rails navigation)
  {
    "tpope/vim-projectionist",
    config = function()
      -- Set up keymaps for convenience
      vim.keymap.set("n", "<leader>a", "<cmd>A<CR>", { desc = "Projectionist: Alternate file" })
      vim.keymap.set("n", "<leader>av", "<cmd>AV<CR>", { desc = "Projectionist: Alternate vsplit" })
      vim.keymap.set("n", "<leader>as", "<cmd>AS<CR>", { desc = "Projectionist: Alternate split" })
    end,
  },
}
