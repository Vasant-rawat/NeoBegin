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
[Customization](#-customization)

</div>

## 🚀 Key Features

- **Plugin Management**: Managed by `pckr.nvim`
- **Autocompletion**: Powered by `nvim-cmp`
- **File Navigation**: `nvim-tree` and `telescope.nvim`
- **Syntax Highlighting**: `nvim-treesitter`
- **Git Integration**: `vim-fugitive`
- **LSP Support**: `nvim-lspconfig` with `mason.nvim` and `lsp-zero.nvim`
- **Terminal Integration**: `toggleterm.nvim`
- **Undo History**: `undotree`

## ⚡ Quick Start

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Vasant-rawat/NeoBegin.git ~/.config/nvim
    ```

2. **Install `pckr.nvim`**:
    ```bash
    git clone --filter=blob:none https://github.com/lewis6991/pckr.nvim ~/.local/share/nvim/site/pack/pckr/start/pckr.nvim
    ```

3. **Start Neovim**:
    ```bash
    nvim
    ```

4. **Sync plugins**:
    Inside Neovim, run:
    ```vim
    :PckrSync
    ```

5. **Verify installation**:
    Inside Neovim, run:
    ```vim
    :checkhealth
    ```

## 🎹 Keybindings

- **File Explorer**: `<leader>e` to toggle `nvim-tree`
- **Find Files**: `<leader>ff` to open `telescope.nvim` file finder
- **Live Grep**: `<leader>fg` to search text in files
- **Buffers**: `<leader>fb` to list open buffers
- **Help Tags**: `<leader>fh` to find help tags
- **Git Status**: `<leader>gs` to open `vim-fugitive` Git status
- **Undo Tree**: `<leader>u` to toggle `undotree`
- **Terminal**: `<C-\>` to open a floating terminal

## 📂 Directory Structure

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













