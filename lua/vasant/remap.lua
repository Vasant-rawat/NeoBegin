--this is for settting a leader key which is space bar
vim.g.mapleader=" "
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
