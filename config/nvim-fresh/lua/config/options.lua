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
opt.timeoutlen = 300
opt.spelllang = { "en" }

vim.g.autoformat = true
