local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core dependencies
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "MunifTanjim/nui.nvim" },

    -- ColorScheme
    { 
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
            }
        end,
        init = function()
            vim.cmd("colorscheme poimandres")
        end
    },
    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "poimandres",
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                },
            })
        end,
    },

    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,terminal,globals"
            
            -- Set up tab behavior
            vim.o.hidden = true  -- Allow buffers to be hidden without saving
            
            require("bufferline").setup({
                options = {
                    mode = "tabs",
                    separator_style = "slant",
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    color_icons = true,
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    show_tab_indicators = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true
                        }
                    },
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    },
                    indicator = {
                        icon = '▎',
                        style = 'icon',
                    },
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    max_name_length = 18,
                    max_prefix_length = 15,
                    truncate_names = true,
                    tab_size = 18,
                },
                highlights = {
                    separator = {
                        fg = { attribute = "bg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    separator_selected = {
                        fg = { attribute = "bg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "Normal" }
                    },
                    background = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" }
                    },
                    buffer_selected = {
                        fg = { attribute = "fg", highlight = "Normal" },
                        bg = { attribute = "bg", highlight = "Normal" },
                        bold = true,
                        italic = true,
                    },
                    fill = {
                        bg = { attribute = "bg", highlight = "TabLineFill" }
                    }
                },
            })
            -- Auto-create new tabs for new files
            local function create_new_tab()
                vim.cmd('tabnew %')
            end

            -- Keymaps for tab navigation
            vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
            vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
            vim.keymap.set('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
            vim.keymap.set('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
            vim.keymap.set('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
            vim.keymap.set('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {})
            vim.keymap.set('n', '<Leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {})
            vim.keymap.set('n', '<Leader>$', '<Cmd>BufferLineGoToBuffer -1<CR>', {})
            vim.keymap.set('n', '<Leader>x', '<Cmd>BufferLinePickClose<CR>', {})
            vim.keymap.set('n', '<Leader>X', '<Cmd>BufferLineCloseOthers<CR>', {})
            vim.keymap.set('n', '<Leader>p', '<Cmd>BufferLinePick<CR>', {})
            vim.keymap.set('n', '<Leader>tp', '<Cmd>BufferLineTogglePin<CR>', {})
            vim.keymap.set('n', '<Leader>tn', create_new_tab, {})
        end,
    },

    -- Indent Guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                },
                scope = {
                    enabled = true,
                    show_start = true,
                },
            })
        end,
    },

    -- Colorizer
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({})
        end,
    },

    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    position = "left",
                    width = 30,
                    mappings = {
                        ["<space>"] = "none",
                        ["l"] = "open_with_window_picker",
                        ["h"] = "close_node",
                        ["v"] = "vsplit_with_window_picker",
                        ["s"] = "split_with_window_picker",
                        ["t"] = "open_tabnew", -- Open in new tab
                        ["a"] = "add",
                        ["A"] = "add_directory",
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy",
                        ["m"] = "move",
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source",
                    }
                },
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            ".git",
                            "node_modules",
                            ".cache",
                        },
                    },
                    follow_current_file = true,
                    hijack_netrw_behavior = "open_current",
                    use_libuv_file_watcher = true,
                    window = {
                        mappings = {
                            ["<cr>"] = "open_tabnew",
                            ["o"] = "open_tabnew",
                            ["O"] = "open_with_window_picker",
                        }
                    }
                },
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function()
                            require("neo-tree.command").execute({ action = "close" })
                        end
                    },
                }
            })
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "vim", "javascript", "typescript", "python", "rust",
                    "go", "c", "cpp", "java", "html", "css", "json", "yaml",
                    "markdown", "bash", "dockerfile", "gitignore"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = "<C-s>",
                        node_decremental = "<C-backspace>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
            })
        end,
    },

    -- AI Code Assistant
    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
        config = function()
            vim.g.codeium_disable_bindings = 1
            vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end,
    },

    -- Better Syntax Highlighting
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                position = "bottom",
                height = 10,
                width = 50,
                icons = true,
                mode = "workspace_diagnostics",
                fold_open = "v",
                fold_closed = ">",
                group = true,
                padding = true,
                action_keys = {
                    close = "q",
                    cancel = "<esc>",
                    refresh = "r",
                    jump = {"<cr>", "<tab>"},
                    open_split = {"<c-x>"},
                    open_vsplit = {"<c-v>"},
                    open_tab = {"<c-t>"},
                    jump_close = {"o"},
                    toggle_mode = "m",
                    toggle_preview = "P",
                    hover = "K",
                    preview = "p",
                    close_folds = {"zM", "zm"},
                    open_folds = {"zR", "zr"},
                    toggle_fold = {"zA", "za"},
                    previous = "k",
                    next = "j"
                },
            })
        end,
    },

    -- Navigation
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon").setup({})
        end,
    },

    -- Git
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end,
    },

    -- Other tools
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
        end,
    },

    -- LSP and Completion
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = false,
        priority = 500,
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = function()
            -- Initialize Mason first
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'tsserver',
                    'eslint',
                },
                handlers = {
                    require('lsp-zero').default_setup,
                }
            })

            -- LSP Setup
            local lsp_zero = require('lsp-zero')
            lsp_zero.preset("recommended")

            lsp_zero.on_attach(function(client, bufnr)
                -- LSP keybindings
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)

            -- Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

            -- Completion Setup
            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}

            -- Load snippets
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'luasnip'},
                    {name = 'buffer'},
                    {name = 'path'},
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
                }),
            })
        end
    },
   {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
  	[[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ]],
  	[[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
  	[[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ]],
  	[[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
  	[[          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
  	[[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
  	[[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
  	[[ ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
    [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ]],
    [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
    [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
},
    {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
},
}) 
