vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead

local opt = vim.opt
local g = vim.g

g.noswapfile = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
