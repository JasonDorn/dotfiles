return {
  -- Telescope customization (LazyVim includes telescope by default)
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "*.pyc",
          "__pycache__",
          ".venv",
          "venv",
        },
      },
    },
  },
  -- Neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
      { "<leader>fe", "<cmd>Neotree focus<cr>", desc = "Focus file explorer" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
