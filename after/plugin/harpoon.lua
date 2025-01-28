-- First, ensure the modules are properly loaded
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Then set up the keymaps
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hr", mark.rm_file)  -- Changed from ui.rm_file to mark.rm_file
vim.keymap.set("n", "<leader>hc", mark.clear_all)

-- Navigation
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
