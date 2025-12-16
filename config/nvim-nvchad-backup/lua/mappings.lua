require "nvchad.mappings"
local neotest = require "neotest"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
---- Save with double leader (space space)
map("n", "<leader><leader>", "<cmd>w<cr>", { desc = "Save file" })

map("n", "<leader>l", function()
  require("leap").leap { target_windows = { vim.fn.win_getid() } }
end, { desc = "Leap forward in window" })

map("n", "<leader>L", function()
  require("leap").leap { target_windows = require("leap.util").get_enterable_windows() }
end, { desc = "Leap across all windows" })

map({ "x", "o" }, "<leader>l", function()
  require("leap").leap { target_windows = { vim.fn.win_getid() } }
end, { desc = "Leap in visual/op mode" })

map("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand "%")
end, { desc = "Run file tests" })

map("n", "<leader>tt", function()
  neotest.run.run()
end, { desc = "Run nearest test" })

map("n", "<leader>ts", function()
  neotest.summary.toggle()
end, { desc = "Toggle test summary" })

map("n", "<leader>to", function()
  neotest.output_panel.toggle()
end, { desc = "Toggle output panel" })

map("n", "<leader>tmf", function()
  local file_path = vim.fn.expand "%"
  local pos = require("neotest").state.positions(file_path)
  require("neotest").run.run {
    position = pos and pos:file(),
    extra_args = { "--create-db", "--migrations" },
  }
end, { desc = "Run file tests with migrations" })

map("n", "<leader>tbf", function()
  local file_path = vim.fn.expand "%"
  local pos = require("neotest").state.positions(file_path)
  require("neotest").run.run {
    position = pos and pos:file(),
    env = { BROWSER = "true" },
  }
end, { desc = "Run file tests in browser" })

map("n", "<leader>tbt", function()
  neotest.run.run {
    env = { BROWSER = "true" },
  }
end, { desc = "Run nearest test in browser" })

map("n", "<leader>tmt", function()
  neotest.run.run {
    extra_args = { "--create-db", "--migrations" },
  }
end, { desc = "Run nearest test with migrations" })

map("n", "<leader>td", function()
  require("neotest").run.run { strategy = "dap" }
end, { desc = "Debug nearest test" })

map("n", "<leader>tdf", function()
  require("neotest").run.run { vim.fn.expand "%", strategy = "dap" }
end, { desc = "Debug test file" })

map("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
-- toggle the quick menu
map("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
-- navigate to Harpoon files 1–4
map("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

-- Navigate buffers with Shift‑H / Shift‑L
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Copy minimal fast pytest command for current context (file / class / test)
map("n", "<leader>cp", function()
  local file = vim.fn.expand "%:p"

  -- find nearest test function above cursor
  local func_lnum = vim.fn.search("^[ \t]*def \\(test_\\w*\\)", "bnW")
  local func_name = nil
  if func_lnum > 0 then
    func_name = vim.fn.matchstr(vim.fn.getline(func_lnum), "def \\zs\\w\\+")
  end

  -- find nearest pytest-style class above cursor
  local class_lnum = vim.fn.search("^[ \t]*class \\(Test\\w*\\)", "bnW")
  local class_name = nil
  if class_lnum > 0 then
    class_name = vim.fn.matchstr(vim.fn.getline(class_lnum), "class \\zs\\w\\+")
  end

  -- Build target: file [::Class] [::test]
  local target = file
  if func_name then
    if class_name and class_lnum < func_lnum then
      target = string.format("%s::%s::%s", file, class_name, func_name)
    else
      target = string.format("%s::%s", file, func_name)
    end
  elseif class_name then
    target = string.format("%s::%s", file, class_name)
  end

  local cmd = string.format("pytest %s --reuse-db --disable-warnings -q", target)
  vim.fn.setreg("+", cmd)
  print("Copied to clipboard: " .. cmd)
end, { desc = "Copy minimal pytest cmd (file/class/test) with reuse-db" })
