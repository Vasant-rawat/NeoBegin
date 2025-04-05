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

```markdown
        ~/.config/nvim/
        ├── init.lua
        ├── lua/
        │   ├── vasant/
        │   │   ├── init.lua
        │   │   ├── pckr.lua
        │   │   ├── remap.lua
        │   │   ├── set.lua
        │   │   └── plugins/
        │   │       ├── colors.lua
        │   │       ├── fugitive.lua
        │   │       ├── harpoon.lua
        │   │       ├── lsp.lua
        │   │       ├── neotree.lua
        │   │       ├── telescope.lua
        │   │       ├── treesitter.lua
        │   │       ├── undotree.lua
        │   │       └── floatingTerminal.lua

```













