<div align="center">

# 🚀 Neovim

[![Lua](https://img.shields.io/badge/Built%20with-Lua-blue.svg?style=for-the-badge&logo=lua)](https://lua.org)
[![Neovim](https://img.shields.io/badge/Built%20for-Neovim-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)

![Neovim Screenshot](https://github.com/Vasant-rawat/NeoBegin/blob/main/assets/Screen1.png)
![Neovim Screenshot](https://github.com/Vasant-rawat/NeoBegin/blob/main/assets/Screen2.png)

*A supercharged ⚡ Neovim configuration for the modern developer*

[Key Features](#-key-features) •
[Quick Start](#-quick-start) •
[Keybindings](#-keybindings) •
[Customization](#-customization) •
[Structure](#-structure)

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

## ⚡ Quick Start

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Vasant-rawat/NeoBegin.git ~/.config/nvim
    ```

2. **Start Neovim**:
    ```bash
    nvim
    ```

3. **Sync plugins**:
    Inside Neovim, run:
    ```vim
    :Lazy sync
    ```

4. **Verify installation**:
    Inside Neovim, run:
    ```vim
    :checkhealth
    ```

## 🎹 Keybindings

- **File Explorer**: `<leader>e` to toggle `neo-tree`
- **Find Files**: `<leader>ff` to open `telescope.nvim` file finder
- **Live Grep**: `<leader>fg` to search text in files
- **Buffers**: `<leader>fb` to list open buffers
- **Help Tags**: `<leader>fh` to find help tags
- **Git Status**: `<leader>gs` to open `vim-fugitive` Git status
- **Undo Tree**: `<leader>u` to toggle `undotree`
- **Terminal**: `<C-\>` to open a floating terminal

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

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

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













