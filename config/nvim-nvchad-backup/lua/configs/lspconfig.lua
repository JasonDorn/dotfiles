-- ~/.config/nvim/lua/custom/configs/lspconfig.lua

local lspconfig = require("lspconfig")
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- 🚫 REMOVE tsserver if using volar in takeOverMode

-- ✅ Volar in Take Over Mode (handles .vue, .ts, .js, etc.)
--
-- ~/.config/nvim/lua/custom/configs/lspconfig.lua

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue"
  },
  init_options = {
    typescript = {
      tsdk = "/Users/json/.nvm/versions/node/v23.10.0/lib/node_modules/typescript/lib"
    },
    languageFeatures = {
      implementation = true,
      references = true,
      definition = true,     -- 🔥 Enable `gd`
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      signatureHelp = true,
      codeAction = true,
      completion = {
        defaultTagNameCase = "both",
        defaultAttrNameCase = "kebabCase",
        getDocumentNameCasesRequest = false,
        getDocumentSelectionRequest = false
      }
    },
    documentFeatures = {
      documentSymbol = true,
      documentColor = true,
      documentFormatting = {
        defaultPrintWidth = 100
      }
    }
  }
}

-- ✅ ESLint
lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- ✅ HTML
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- ✅ CSS
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- ✅ Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.ruff.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- ✅ Lua (for Neovim config dev)
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
