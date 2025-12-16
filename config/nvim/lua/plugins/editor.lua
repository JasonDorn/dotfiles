return {
  -- Telescope with performance optimizations
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          -- Use ripgrep for live_grep (faster than default)
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden", -- Search hidden files
            "--glob=!.git/", -- But ignore .git
          },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "*.pyc",
            "__pycache__",
            ".venv",
            "venv",
          },
          -- Performance optimizations
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          -- Faster file finding
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        },
        pickers = {
          find_files = {
            -- Use fd instead of find (much faster)
            find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
          },
        },
      })
      -- Load fzf native extension for faster fuzzy finding
      telescope.load_extension("fzf")
    end,
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
