print("Initializing pckr.nvim")

local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/site/pack/pckr/start/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end
    vim.cmd("packadd pckr.nvim")
end

bootstrap_pckr()

local pckr = require('pckr')
pckr.add({
    -- Core dependencies first
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup{}
        end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- ColorScheme
    'rebelot/kanagawa.nvim',

    -- Neo-tree
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('neo-tree').setup{}
        end
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup{
                ensure_installed = { "lua", "vim", "javascript", "typescript" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
            }
        end
    },

    -- Navigation
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("harpoon").setup{}
        end
    },

    -- Git
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },

    -- Other tools
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    -- Terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup()
        end
    },

    -- LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
})