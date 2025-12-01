-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap.set

-- Save and quit
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader><leader>", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Command mode shortcut
keymap("n", ";", ":", { desc = "Enter command mode", nowait = true })

-- Window navigation (alternative to Ctrl+hjkl)
keymap("n", "gh", "<C-w>h", { desc = "Window left" })
keymap("n", "gl", "<C-w>l", { desc = "Window right" })
keymap("n", "gj", "<C-w>j", { desc = "Window down" })
keymap("n", "gk", "<C-w>k", { desc = "Window up" })

-- Copy file path as dot notation (e.g. app.models.user)
keymap("n", "<leader>cp", '<cmd>:let @+ = substitute(expand("%:p:~:.") , "/", ".", "g")<CR>', { desc = "Copy file path" })

-- Scrolling
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result centered" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

keymap("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
