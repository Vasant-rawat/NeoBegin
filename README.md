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
- **Enhanced Git Integration**: `gitsigns.nvim` for inline git decorations and hunk operations.
- **LSP Support**: `nvim-lspconfig` with `mason.nvim` and `lsp-zero.nvim`
- **Terminal Integration**: `toggleterm.nvim`
- **Undo History**: `undotree`
- **Modern UI**: `poimandres.nvim` theme with `lualine.nvim` and `bufferline.nvim`
- **Indent Guides**: `indent-blankline.nvim` for better code readability
- **Color Highlighting**: `nvim-colorizer.lua` for CSS and color codes
- **Effortless Commenting**: `Comment.nvim` for quick code commenting.
- **Auto Pairing**: `nvim-autopairs` for automatic bracket and quote closing.
- **Session Management**: `auto-session` for saving and restoring sessions.
- **Smooth Scrolling**: `nvim-scrollbar` for visual scrollbars.

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

### Navigation & File Explorer (Neo-tree)
- **Toggle File Explorer**: `<leader>e`
- **Focus File Explorer**: `<leader>o`
- **Inside Neo-tree:**
  - `h` - Close node / Go to parent directory
  - `l` - Open node / Enter directory
  - `v` - Open in vertical split
  - `s` - Open in horizontal split
  - `t` - Open in new tab
  - `<cr>` or `o` - Open file in new tab (respects `neo-tree` config)
  - `O` - Open file with window picker (respects `neo-tree` config)
  - `a` - Add file/directory
  - `A` - Add directory (alternative)
  - `d` - Delete file/directory
  - `r` - Rename file/directory
  - `y` - Copy path to clipboard
  - `x` - Cut file/directory to clipboard
  - `p` - Paste from clipboard
  - `c` - Copy file/directory (internal Neo-tree copy)
  - `m` - Move file/directory
  - `q` - Close Neo-tree window
  - `R` - Refresh Neo-tree
  - `?` - Show help/keybindings within Neo-tree

### Telescope (Fuzzy Finding)
- **Find Files**: `<leader>ff`
- **Live Grep**: `<leader>fg`
- **Buffers**: `<leader>fb`
- **Help Tags**: `<leader>fh`
- **Recent Files**: `<leader>fr`

### Git (vim-fugitive & gitsigns.nvim)
- **vim-fugitive Git Status**: `<leader>gs`
- **vim-fugitive Git Blame**: `<leader>gb`
- **vim-fugitive Git Diff**: `<leader>gd`

#### Gitsigns
- `]c` - Next hunk
- `[c` - Previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line (full)
- `<leader>tb` - Toggle current line blame
- `<leader>hd` - Diff this
- `<leader>hD` - Diff this ~
- `ih` (in visual/operator pending mode) - Select hunk text object

### Commenting (Comment.nvim)
- `gcc` - Toggle comment for current line (Normal mode)
- `gc` - Toggle comment for selection (Visual mode)

### Session Management (auto-session)
- `<leader>ws` - Save session for current directory
- `<leader>wr` - Restore session for current directory

### LSP Actions
- **LSP Hover**: `K`
- **LSP Definition**: `gd`
- **LSP References**: `gr`
- **Code Actions**: `<leader>ca`
- **Rename Symbol**: `<leader>rn`
- **Show Diagnostics**: `<leader>d` (float)
- **Next Diagnostic**: `]d`
- **Previous Diagnostic**: `[d`

### Other Tools
- **Undo Tree**: `<leader>u`
- **Terminal**: `<C-\>` (toggle floating terminal)
- **Format Code**: `<leader>f` (uses LSP)

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
- **nvim-web-devicons**: File icons for UI elements
- **nui.nvim**: UI components library (used by other plugins)

### UI
- **poimandres.nvim**: Modern, elegant color scheme.
- **lualine.nvim**: Feature-rich status line.
- **bufferline.nvim**: Advanced buffer/tab management. Includes tab indicators for modified files, LSP diagnostics, file icons, hover preview, slanted separators, auto-truncation for long filenames, a special section for the file explorer, and tab pinning support.
- **indent-blankline.nvim**: Visual indent guides.
- **nvim-colorizer.lua**: Highlights color codes (e.g., hex, rgb) in files.
- **nvim-scrollbar**: Smooth scrollbar integration.

### Navigation
- **neo-tree**: Powerful and configurable file explorer.
- **telescope.nvim**: Highly extendable fuzzy finder for files, buffers, grep, etc.
- **harpoon**: Quick file marking and navigation system.

### Development & Coding Aids
- **nvim-treesitter**: Advanced syntax highlighting, code parsing, and text objects.
- **nvim-lspconfig**: Configurations for the Neovim LSP client.
- **mason.nvim**: Manages LSP servers, DAP servers, linters, and formatters.
- **lsp-zero.nvim**: Simplifies LSP setup and configuration.
  - *Note: Includes support for Lua (lua_ls), TypeScript/JavaScript (tsserver), ESLint, Go (gopls), Bash (bashls), HTML (html), CSS (cssls), and Tailwind CSS (tailwindcss).*
- **nvim-cmp**: Powerful autocompletion engine.
- **LuaSnip**: Snippet engine for `nvim-cmp`.
- **Comment.nvim**: Context-aware commenting plugin, supports various comment styles.
- **nvim-autopairs**: Automatically closes pairs of brackets, quotes, etc.

### Git Integration
- **vim-fugitive**: A classic Git wrapper for Neovim.
- **gitsigns.nvim**: Displays Git signs in the gutter, allows hunk operations (staging, resetting, previewing), shows blame information, and enables diffing.

### Terminal
- **toggleterm.nvim**: Manages embedded terminals within Neovim.

### Utility & Workflow
- **undotree**: Visualizes and navigates the undo history.
- **auto-session**: Automatically saves and restores sessions.

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
- `poimandres.nvim` and other theme creators for beautiful themes.
- All plugin authors for their invaluable contributions to the Neovim ecosystem.
