return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "ruff",
        "debugpy",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "python",
        "htmldjango",
        "javascript",
        "typescript",
        "vue",
        "lua",
        "json",
        "yaml",
        "bash",
        "css",
        "html",
        "markdown",
        "markdown_inline",
        "regex",
        "toml",
        "vim",
        "vimdoc",
      })
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
      opts.indent = { enable = true }
      opts.incremental_selection = { enable = true }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff_lsp = {
          init_options = {
            settings = {
              args = {},
            },
          },
        },
      },
    },
  },
}
