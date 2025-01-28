require("toggleterm").setup({
    size = 20, -- Size of the terminal (for horizontal split)
    open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- Dim terminal colors by this factor
    direction = "horizontal", -- Options: 'horizontal', 'vertical', 'float'
    float_opts = {
        border = "curved", -- Border style: 'single', 'double', 'shadow', 'curved'
        winblend = 3,
    },
})

-- Keybindings
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { silent = true, desc = "Floating terminal" })
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { silent = true, desc = "Horizontal terminal" })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { silent = true, desc = "Vertical terminal" })

