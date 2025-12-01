-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.relativenumber = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 50
opt.timeoutlen = 200
opt.ttimeoutlen = 0
opt.spelllang = { "en" }
opt.termguicolors = true

vim.g.autoformat = true

-- Disable semantic tokens that can override treesitter colors
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
