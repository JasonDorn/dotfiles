-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead

local opt = vim.opt
-- local g = vim.g

-- g.copilot_assume_mapped = true

opt.swapfile = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
-- vim.cmd([[
--     au BufRead,BufNewFile *.rabl setf ruby
--     set autoindent expandtab tabstop=2 shiftwidth=2
-- ]])