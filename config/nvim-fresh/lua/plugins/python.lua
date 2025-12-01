return {
  {
    "mason-org/mason.nvim",
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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          on_init = function(client)
            -- Auto-detect pequity venv
            local cwd = vim.fn.getcwd()
            if string.find(cwd, "pequity") then
              client.config.settings.python.pythonPath = "/Users/json/Developer/pequity/.venv/bin/python"
            end
          end,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                -- Reduce Django-related noise (django-stubs will help too)
                diagnosticSeverityOverrides = {
                  reportGeneralTypeIssues = "none", -- Django relationship issues
                  reportOptionalMemberAccess = "none", -- Nullable relationship warnings
                  reportAttributeAccessIssue = "none", -- Dynamic Django attributes
                  reportUnknownMemberType = "none", -- QuerySet type issues
                  reportUnknownArgumentType = "none", -- Django model field args
                  reportUnknownVariableType = "none", -- Auto-generated fields
                },
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
