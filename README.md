<div align="center">

# 🚀 Neovim

[![Lua](https://img.shields.io/badge/Built%20with-Lua-blue.svg?style=for-the-badge&logo=lua)](https://lua.org)
[![Neovim](https://img.shields.io/badge/Built%20for-Neovim-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

![Neovim Screenshot](https://github.com/Vasant-rawat/NeoBegin/blob/main/assets/Screen1.png)
![Neovim Screenshot](https://github.com/Vasant-rawat/NeoBegin/blob/main/assets/Screen2.png)

*A supercharged ⚡ Neovim configuration for the modern developer*

[Key Features](#-key-features) •
[Quick Start](#-quick-start) •
[Keybindings](#-keybindings) •
[Customization](#-customization) •
[Structure](#-structure) •
[Plugins](#-plugins) •
[Troubleshooting](#-troubleshooting)

</div>

## 🚀 Key Features

- **Plugin Management**: Managed by `lazy.nvim` (Modern and fast plugin manager)
- **Autocompletion**: Powered by `nvim-cmp` with `LuaSnip`
- **File Navigation**: `neo-tree` and `telescope.nvim`
- **Syntax Highlighting**: `nvim-treesitter`
- **Git Integration**: `vim-fugitive`
- **LSP Support**: `nvim-lspconfig` with `mason.nvim` and `lsp-zero.nvim`
- **Terminal Integration**: `toggleterm.nvim`
- **Undo History**: `undotree`
- **Modern UI**: `tokyonight.nvim` theme with `lualine.nvim` and `bufferline.nvim`
- **Indent Guides**: `indent-blankline.nvim` for better code readability
- **Color Highlighting**: `nvim-colorizer.lua` for CSS and color codes

## ⚡ Quick Start

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Vasant-rawat/NeoBegin.git ~/.config/nvim
    ```

2. **Install Nerd Font** (recommended):
    ```bash
    # For example, using FiraCode Nerd Font
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code-nerd-font
    ```

3. **Start Neovim**:
    ```bash
    nvim
    ```

4. **Sync plugins**:
    Inside Neovim, run:
    ```vim
    :Lazy sync
    ```

5. **Verify installation**:
    Inside Neovim, run:
    ```vim
    :checkhealth
    ```

## 🎹 Keybindings

### Navigation
- **File Explorer**: `<leader>e` to toggle `neo-tree`
- **Find Files**: `<leader>ff` to open `telescope.nvim` file finder
- **Live Grep**: `<leader>fg` to search text in files
- **Buffers**: `<leader>fb` to list open buffers
- **Help Tags**: `<leader>fh` to find help tags
- **Recent Files**: `<leader>fr` to find recently opened files

### Git
- **Git Status**: `<leader>gs` to open `vim-fugitive` Git status
- **Git Blame**: `<leader>gb` to show Git blame
- **Git Diff**: `<leader>gd` to show Git diff

### Other
- **Undo Tree**: `<leader>u` to toggle `undotree`
- **Terminal**: `<C-\>` to open a floating terminal
- **Format Code**: `<leader>f` to format current buffer
- **LSP Hover**: `K` to show hover information
- **LSP Definition**: `gd` to go to definition
- **LSP References**: `gr` to show references

### Tab Management
- **Navigate Tabs**:
  - `<Tab>` - Go to next tab
  - `<S-Tab>` - Go to previous tab
  - `<Leader>1-5` - Go to tab 1-5
  - `<Leader>$` - Go to last tab
- **Tab Operations**:
  - `<Leader>x` - Pick tab to close
  - `<Leader>X` - Close other tabs
  - `<Leader>p` - Pick tab to switch to
  - `<Leader>tp` - Toggle pin current tab

## 📂 Structure

```markdown
~/.config/nvim/
├── init.lua              # Main entry point
├── lazy-lock.json        # Plugin version lock file
└── lua/
    └── vasant/
        ├── init.lua      # Core configuration loader
        ├── lazy.lua      # Plugin configurations
        ├── remap.lua     # Key mappings
        └── set.lua       # General settings
```

## 🔌 Plugins

### Core
- **lazy.nvim**: Modern plugin manager
- **plenary.nvim**: Required by many plugins
- **nvim-web-devicons**: File icons
- **nui.nvim**: UI components

### UI
- **tokyonight.nvim**: Modern color scheme
- **lualine.nvim**: Status line
- **bufferline.nvim**: Buffer tabs
- **indent-blankline.nvim**: Indent guides
- **nvim-colorizer.lua**: Color highlighting

### Navigation
- **neo-tree**: File explorer
- **telescope.nvim**: Fuzzy finder
- **harpoon**: Quick file navigation

### Development
- **nvim-treesitter**: Syntax highlighting
- **nvim-lspconfig**: LSP configuration
- **mason.nvim**: LSP installer
- **lsp-zero.nvim**: LSP setup helper
- **nvim-cmp**: Autocompletion
- **LuaSnip**: Snippets

### Git
- **vim-fugitive**: Git integration
- **gitsigns.nvim**: Git signs in gutter

### Terminal
- **toggleterm.nvim**: Terminal integration

## 🎨 Customization

### Colorscheme
The configuration uses `tokyonight.nvim` as the default colorscheme. You can change it by modifying the theme in `lua/vasant/lazy.lua`.

Available variants:
- `tokyonight-night` (default)
- `tokyonight-storm`
- `tokyonight-day`
- `tokyonight-moon`

### Adding New Plugins
To add new plugins, edit `lua/vasant/lazy.lua` and add your plugin configuration following the same pattern:

```lua
{
    "username/plugin-name",
    config = function()
        -- Plugin configuration here
    end,
    dependencies = {
        -- Dependencies here
    }
}
```

### Keybindings
Customize keybindings in `lua/vasant/remap.lua`. The configuration uses `<leader>` as the main prefix key.

## 🛠️ Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (recommended for icons)
- Node.js (for some LSP servers)
- Python (for some plugins)

## 🔍 Troubleshooting

### Common Issues

1. **Plugin Installation Fails**
   - Run `:Lazy clean`
   - Run `:Lazy sync`
   - Check your internet connection

2. **Colorscheme Not Working**
   - Ensure `termguicolors` is enabled
   - Check if your terminal supports true color

3. **LSP Not Working**
   - Run `:Mason` to install LSP servers
   - Check `:LspInfo` for server status
   - Verify file type detection

4. **Performance Issues**
   - Check `:checkhealth`
   - Disable heavy plugins if needed
   - Consider using `lazy.nvim`'s lazy loading

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [lazy.nvim](https://github.com/folke/lazy.nvim) for the amazing plugin manager
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for the beautiful theme
- All plugin authors for their contributions

# Vasant's Neovim Configuration

A modern, clean, and efficient Neovim configuration built with Lazy.nvim.

## ⌨️ Keybindings

### File Navigation
- **File Explorer (Neo-tree)**:
  - `<leader>e` - Toggle file explorer
  - `<leader>o` - Focus file explorer
  - `h` - Close node/go to parent
  - `l` - Open node/file with window picker
  - `v` - Open in vertical split
  - `s` - Open in horizontal split
  - `t` - Open in new tab
  - `<cr>` or `o` - Open in new tab
  - `O` - Open with window picker

### Tab Management
- **Navigation**:
  - `<Tab>` - Next tab
  - `<S-Tab>` - Previous tab
  - `<Leader>1-5` - Go to tab 1-5
  - `<Leader>$` - Go to last tab
- **Operations**:
  - `<Leader>x` - Pick tab to close
  - `<Leader>X` - Close other tabs
  - `<Leader>p` - Pick tab to switch to
  - `<Leader>tp` - Toggle pin current tab
  - `<Leader>tn` - Create new tab

### LSP Features
- **Code Navigation**:
  - `gd` - Go to definition
  - `K` - Show hover information
  - `<leader>vws` - Workspace symbol search
  - `<leader>vd` - Show diagnostics float
  - `[d` - Next diagnostic
  - `]d` - Previous diagnostic
  - `<leader>vca` - Code actions
  - `<leader>vrr` - Show references
  - `<leader>vrn` - Rename symbol
  - `<C-h>` - Show signature help (in insert mode)

### Completion
- **Code Completion**:
  - `<C-p>` - Select previous item
  - `<C-n>` - Select next item
  - `<C-y>` or `<CR>` - Confirm selection
  - `<C-Space>` - Trigger completion
  - `<Tab>` - Next item/expand snippet
  - `<S-Tab>` - Previous item

### AI Assistant (Codeium)
- **AI Suggestions**:
  - `<C-g>` - Accept suggestion
  - `<C-;>` - Next suggestion
  - `<C-,>` - Previous suggestion
  - `<C-x>` - Clear suggestions

### File Operations (in Neo-tree)
- **File Management**:
  - `a` - Add file
  - `A` - Add directory
  - `d` - Delete
  - `r` - Rename
  - `y` - Copy to clipboard
  - `x` - Cut to clipboard
  - `p` - Paste from clipboard
  - `c` - Copy
  - `m` - Move
  - `q` - Close window
  - `R` - Refresh
  - `?` - Show help

### Other Tools
- **Git**:
  - `<leader>gs` - Git status
- **Undo Tree**:
  - `<leader>u` - Toggle undo tree
- **Terminal**:
  - Built-in terminal support (ToggleTerm)

## Features

### Core Features
- **Modern UI**: Clean and minimal interface with Tokyo Night theme
- **File Explorer**: Neo-tree with intuitive navigation and file operations
- **Status Line**: Lualine with custom styling
- **Buffer Management**: Bufferline for tab-like buffer navigation
- **Indent Guides**: Visual indent guides with scope highlighting
- **Color Preview**: Real-time color code highlighting
- **Fuzzy Finder**: Telescope for efficient file and content search
- **Git Integration**: Fugitive for Git operations
- **Terminal**: ToggleTerm for integrated terminal access
- **Undo History**: Visual undo tree

### Enhanced Development Features
- **Advanced Syntax Highlighting**: 
  - Treesitter with support for multiple languages
  - Incremental selection and text object manipulation
  - Better error and warning highlighting
- **LSP and Autocompletion**:
  - Language Server Protocol support
  - Intelligent code completion
  - Snippet support
  - Code actions and diagnostics
- **AI Code Assistant**:
  - Codeium integration for AI-powered code suggestions
  - Smart code completion
  - Context-aware suggestions
- **Diagnostics and Troubleshooting**:
  - Trouble.nvim for better error visualization
  - Quick navigation to errors and warnings
  - Workspace diagnostics

### Key Features
- **File Explorer**:
  - `<leader>e` - Toggle file explorer
  - `<leader>o` - Focus file explorer
  - Intuitive navigation with `h`, `l`, `v`, `s`
  - File operations: add, delete, rename, copy, paste
  - Auto-close on file open

- **AI Code Assistant**:
  - `<C-g>` - Accept suggestion
  - `<C-;>` - Next suggestion
  - `<C-,>` - Previous suggestion
  - `<C-x>` - Clear suggestions

- **Diagnostics**:
  - `<leader>xx` - Toggle trouble window
  - `<leader>xw` - Show workspace diagnostics
  - `<leader>xd` - Show document diagnostics
  - `<leader>xq` - Show quickfix list
  - `<leader>xl` - Show loclist

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
```

2. Install dependencies:
```bash
# Install Lazy.nvim
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
```

3. Start Neovim and let Lazy.nvim install the plugins:
```bash
nvim
```

## Requirements

- Neovim 0.9.0 or higher
- Git
- A Nerd Font (recommended for icons)

## Customization

The configuration is modular and easy to customize. Key files:
- `lua/vasant/lazy.lua` - Plugin configuration
- `lua/vasant/remap.lua` - Key mappings
- `lua/vasant/set.lua` - Settings

## License

MIT

### Visual Features
- Tab indicators for modified files
- LSP diagnostics in tabs
- File icons and Git status
- Hover preview
- Slanted separators for modern look
- Auto-truncation for long filenames
- Special section for file explorer
- Tab pinning support