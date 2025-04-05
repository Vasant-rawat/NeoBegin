vim.keymap.set("n","<leader>pv",vim.cmd.Ex) 


---Use to replace a selected word with the new one
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- THIS KEYBINDING HELPS TO MOVE A LINE OF SELECTED CODE USING J AND K J FOR downwarsd 
-- direction and K for upward direction 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")--

--To format lsp buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "Format buffer" })

-- Set leader key to space
vim.g.mapleader = " "

-- General
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontally" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- Neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>", { desc = "Focus file explorer" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorscheme" })

-- LSP
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = "Go to references" })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show hover information" })
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, { desc = "Show diagnostics" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "Format buffer" })

-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
-- Terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Navigate left in terminal" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Navigate down in terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Navigate up in terminal" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Navigate right in terminal" })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })

-- Git (Fugitive)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon menu" })
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Navigate to harpoon 1" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Navigate to harpoon 2" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Navigate to harpoon 3" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Navigate to harpoon 4" })

-- Completion keymaps are handled in the cmp setup in lazy.lua





vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus <CR>", { desc = "Find files" })

