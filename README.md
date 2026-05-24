# Neovim Configuration

Personal Neovim configuration built around [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Structure

```
.
├── init.lua              -- Entry point, bootstraps lazy.nvim
├── lazy-lock.json        -- Plugin lockfile
├── lua/
│   ├── config/
│   │   └── settings.lua  -- Vim options, autocommands
│   ├── keymaps.lua       -- Keymap loader
│   ├── keymaps/
│   │   ├── core.lua      -- General keymaps
│   │   └── plugins.lua   -- Plugin-specific keymaps
│   ├── lsp/
│   │   ├── on_attach.lua -- Shared LSP attach logic
│   │   ├── css.lua
│   │   ├── html.lua
│   │   ├── json.lua
│   │   └── vtsls.lua     -- TypeScript LSP config
│   └── plugins/          -- Individual plugin specs
└── README.md
```

## Core Settings

- **Leader:** `<Space>`
- **Line numbers:** Relative + absolute hybrid
- **Indentation:** 4 spaces by default, 2 spaces for web files (JS/TS, JSON, HTML, CSS, YAML, Markdown)
- **Clipboard:** System clipboard (`unnamedplus`)
- **Undo:** Persistent undo history
- **Search:** Smart case, live substitution preview (`inccommand=split`)
- **Auto-create directories** on save when missing

## Plugins

| Plugin | Purpose |
|--------|---------|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & parsing |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configurations |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Completion engine |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (alternative/extra) |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File manager / buffer editor |
| [grapple.nvim](https://github.com/cbochs/grapple.nvim) | Tag & jump to files |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline / symbol tree |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
| [flash.nvim](https://github.com/folke/flash.nvim) | Enhanced search & jump |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap popup helper |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI enhancements for cmdline & messages |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Collection of QoL utilities |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal management |
| [undotree](https://github.com/mbbill/undotree) | Visual undo history |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comment toggling |
| [spider.nvim](https://github.com/chrisgrieser/spider.nvim) | Improved word motion |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Lua development helpers |

## LSP

Configured language servers:

- `vtsls` – TypeScript / JavaScript
- `cssls` – CSS, SCSS, Less
- `html` – HTML
- `jsonls` – JSON

## Installation

1. Backup existing config:
   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```sh
   git clone <repo-url> ~/.config/nvim
   ```

3. Launch Neovim:
   ```sh
   nvim
   ```

   `lazy.nvim` will bootstrap itself and install all plugins on first start.

## Requirements

- [Neovim](https://neovim.io/) >= 0.10
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional but recommended)
- Language servers and formatters (managed externally, e.g. via Mason or system package manager)
