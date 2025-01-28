
-- Neo-tree setup with icons
require('neo-tree').setup({
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
        icon = {
            folder_closed = "", -- Icon for closed folders
            folder_open = "",   -- Icon for open folders
            folder_empty = "",  -- Icon for empty folders
            default = "",       -- Default icon for files
        },
        git_status = {
            symbols = {
                added     = "", -- File added
                modified  = "", -- File modified
                deleted   = "", -- File deleted
                renamed   = "➜", -- File renamed
                untracked = "", -- File untracked
                ignored   = "◌", -- File ignored
                unstaged  = "", -- Changes unstaged
                staged    = "", -- Changes staged
                conflict  = "", -- Conflict
            }
        },
    },
})

-- Keybindings
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, desc = "Toggle Neo-tree" })
vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { silent = true, desc = "Focus Neo-tree" })-- Keybindings
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, desc = "Toggle Neo-tree" })
vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { silent = true, desc = "Focus Neo-tree" })
-- Keybindings with descriptions
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, desc = "Toggle Neo-tree" })
vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { silent = true, desc = "Focus Neo-tree" })

