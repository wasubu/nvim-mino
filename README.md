# 💤 Nvim-Custom (Windows)

![Screenshot](images/nvim-mino.png)

Welcome to my custom Neovim setup! This configuration is designed for Windows users that use Git Bash as their main terminal. featuring lazy-loaded plugins for fast startup and modularity. It focuses on intelligent autocompletion, robust LSP integration, a clean UI/UX, file navigation, and streamlined Git workflows.

#### ⚠️ not tested on other computers
---
## 🪟 Installation (Windows)

Before you begin, ensure you have the following prerequisites installed:
*   ✅ **Git for Windows**
*   ✅ **Neovim v0.9 or newer**
*   ✅ **Node JS**
*   ✅ **Live server**
*   ✅ **Python**

clone the configuration into your Neovim config directory or manually put the files:

### PowerShell
```powershell
git clone https://github.com/yourrepo/nvim-custom.git $env:LOCALAPPDATA\nvim
```

### Command Prompt (`cmd.exe`)
```cmd
git clone https://github.com/yourrepo/nvim-custom.git %LOCALAPPDATA%\nvim
```

### Git Bash
```bash
git clone https://github.com/yourrepo/nvim-custom.git "$LOCALAPPDATA/nvim"
```

---

### ▶️ Launch Neovim

After cloning, simply launch Neovim:
```sh
nvim
```
**`lazy.nvim` will auto-install itself and set up all plugins on first launch**.

---

## 📦 Plugin Overview

| Category | Plugin(s) | Description |
| :---------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------- |
| 🔌 Plugin Manager | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Efficient plugin manager with lazy loading for optimal performance |
| 📁 File Explorer | [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree with fuzzy search, Git integration, and diagnostics |
| ⚙️ LSP | [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language Server Protocol support, managed with Mason and Mason-lspconfig |
| 🧠 Autocomplete | [saghen/blink.cmp](https://github.com/saghen/blink.cmp), [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Advanced completion engine with snippet support |
| 🧼 Formatting | [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Asynchronous format-on-save capabilities |
| 🔤 Syntax | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Advanced syntax highlighting and parsing |
| 🔍 Search | [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Powerful fuzzy finder user interface |
| 💡 Key Hints | [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Pop-up display for keybinding hints |
| 📐 Indentation | [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Visual indentation guides |
| 💬 Comments | [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) | Intelligent comment toggling (`gcc`, `gbc`) |
| 🌐 Live Server | [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim) | Local development server for web projects |
| 🧑‍💻 Dev Tools | [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim), [pmizio/typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | Enhancements for development workflows and Lua/TypeScript LSP |
| 🧾 Git | [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim), [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive), [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb) | Git signs, blame, and GitHub integration |
| 💻 UI & UX | [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim), [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim), [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) | Custom statusline, colorscheme, and startup dashboard |
| 📑 Tabs & Buffers | [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) | Tab-style buffer line for easy navigation |
| 🔄 Autopairs | [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Automatically closes parentheses, brackets, and quotes |
| 🎨 Colorizer | [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | Inline color highlighting in code |
| 🧠 Todo Comments | [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights `TODO`, `FIXME`, `HACK` and other tags in comments |
| 🧠 Tmux Nav | [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless navigation between Vim splits and tmux panes |
| 🧠 Context Tools | [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth) | Automatically detects indentation settings |
| 💾 Undo Manager | [mbbill/undotree](https://github.com/mbbill/undotree) | Visual undo history and management |

---

## 📚 Table of Contents

*   [Plugin Management](#plugin-management)
*   [User Interface](#user-interface)
    *   [Dashboard (Alpha-nvim)](#dashboard-alpha-nvim)
    *   [Status Line (Lualine)](#status-line-lualine)
    *   [Indentation Guides (Indent Blankline)](#indentation-guides-indent-blankline)
    *   [Color Scheme (TokyoNight)](#color-scheme-tokyonight)
    *   [File Explorer (NeoTree)](#file-explorer-neotree)
*   [Language & Autocompletion](#language--autocompletion)
    *   [Language Server Protocol (LSP)](#language-server-protocol-lsp)
    *   [Autocompletion (Blink.cmp & Nvim-cmp)](#autocompletion-blinkcmp--nvim-cmp)
    *   [Syntax Highlighting (Nvim Treesitter)](#syntax-highlighting-nvim-treesitter)
    *   [Code Formatting (Conform.nvim)](#code-formatting-conform.nvim)
*   [Search & Navigation](#search--navigation)
    *   [Fuzzy Finder (Telescope)](#fuzzy-finder-telescope)
    *   [Keybindings (Which-key & Custom Maps)](#keybindings-which-key--custom-maps)
*   [Git Integration](#git-integration)
*   [Utility Plugins](#utility-plugins)
*   [Core Neovim Settings](#core-neovim-settings)

---

## ⚡ Plugin Management

This configuration utilizes **[Lazy.nvim](https://github.com/folke/lazy.nvim)** for efficient plugin management, which ensures all plugins are lazy-loaded for optimal performance and fast startup times.

---

## 🎨 User Interface

### Dashboard (Alpha-nvim)

Alpha-nvim provides a modern and informative start screen with a custom header displaying a stylized "NVIM" logo, along with sections for recent files, keybindings, and more. It depends on `nvim-web-devicons` for icons.

### Status Line (Lualine)

The status line is configured with `nvim-lualine/lualine.nvim`, using the `nord` theme and Nerd Font icons for visual appeal. It displays essential information in various sections:
*   **`lualine_a`**: Current mode (e.g., ` INSERT`)
*   **`lualine_b`**: Git branch
*   **`lualine_c`**: Filename, including file status (read-only, modified)
*   **`lualine_x`**: Diagnostics (errors, warnings), Git diff (added, modified, removed lines), encoding, and filetype
*   **`lualine_y`**: Cursor location
*   **`lualine_z`**: Progress

Some components like diagnostics and diff are conditionally hidden if the window width is less than 100 characters. Lualine is disabled for `alpha` and `neo-tree` filetypes to prevent visual clutter.

### Indentation Guides (Indent Blankline)

The `lukas-reineke/indent-blankline.nvim` plugin provides visual indentation guides using the `▏` character. It's configured to exclude certain filetypes like `help`, `startify`, `dashboard`, `neo-tree`, and `Trouble` for a cleaner interface in those specific buffers.

### Color Scheme (TokyoNight)

The chosen color scheme is **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** with the `storm` style. It features a transparent background for sidebars, floating windows, comments, and keywords. This includes transparency for NeoTree, Telescope, and other UI elements.

### File Explorer (NeoTree)

The **[nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** plugin provides a flexible file tree.
*   **Toggle**: Press `<Space>` or `\` to toggle the NeoTree window (`:Neotree reveal` or `:Neotree close`).
*   **Copy Path**: Press `Y` to trigger the `copy_selector` command, allowing you to copy various path formats (e.g., `FILENAME`, `PATH`, `URI`) to the clipboard.
*   **Open in Default App**: Press `I` to open the selected file or directory in its default application (Windows-specific command `os.execute('start "" "' .. path .. '"')`).
*   **Reveal in OS File Explorer**: Press `E` to reveal the selected file or directory in the operating system's file explorer (Windows-specific command `os.execute('start "" explorer /select,' .. escaped_path)`).
*   **Window width**: The NeoTree window defaults to a width of 25 characters.

---

## 🖋 Language & Autocompletion

### Language Server Protocol (LSP)

LSP support is managed through **`neovim/nvim-lspconfig`**, with automatic LSP server and tool installation handled by **`mason-org/mason.nvim`** and **`mason-org/mason-lspconfig.nvim`**. `blink.cmp` provides additional LSP capabilities. Diagnostics are displayed with floating borders and Nerd Font icons.

**Keymaps for LSP functions** (defined upon `LspAttach` for the current buffer):
*   `grn`: **[R]e[n]ame** the variable under the cursor
*   `gra`: Execute a **code [A]ction** (for normal and visual mode)
*   `grr`: Find **[R]eferences** for the word under the cursor using Telescope
*   `gri`: Jump to **[I]mplementation** using Telescope
*   `grd`: Jump to **[D]efinition** using Telescope
*   `grD`: Jump to **[D]eclaration**
*   `gO`: **Open Document Symbols** using Telescope
*   `gW`: **Open Workspace Symbols** using Telescope
*   `grt`: Jump to **[T]ype Definition** using Telescope
*   `th`: **[T]oggle Inlay [H]ints** (if supported by the LSP)
*   `q`: **Open diagnostic [Q]uickfix list**

The configuration ensures various language servers like `html`, `cssls`, `emmet_ls`, `jsonls`, `yamlls`, `ts_ls`, `clangd`, `bashls`, `marksman`, and `lua_ls` are enabled and automatically installed via `mason-tool-installer`.

### Autocompletion (Blink.cmp & Nvim-cmp)

The autocompletion setup uses **[saghen/blink.cmp](https://github.com/saghen/blink.cmp)** and **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**, with **[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)** for snippet support.
*   Autopairs integration is set up with `nvim-cmp` to ensure smooth completion.
*   The keymap preset is set to `none`, and specific keybindings are defined for navigation and acceptance.
    *   `<CR>`: Accepts the current completion item or falls back to native behavior (which preserves auto-indentation).
    *   `<Esc>`: Hides the completion menu or feeds an escape key to Neovim.
*   **Completion Sources**: Defaults to `lsp`, `path`, `snippets`, and `lazydev`.
*   `lazydev.nvim` is used to configure Lua LSP for Neovim config, runtime, and plugins, improving completion and annotations.

### Syntax Highlighting (Nvim Treesitter)

**[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** provides advanced syntax highlighting and parsing.
*   Run `:TSUpdate` to update language parsers.
*   It is configured to auto-install missing languages.
*   Highlighting and indentation are enabled, with `ruby` specifically handled with additional Vim regex highlighting and disabled for Treesitter's indent to prevent issues.
*   A wide range of languages are ensured to be installed, including `lua`, `python`, `javascript`, `typescript`, `html`, `css`, `json`, `yaml`, `bash`, `go`, `java`, `terraform`, `sql`, and more.

### Code Formatting (Conform.nvim)

**[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)** handles asynchronous code formatting.
*   **Formats on save** (`BufWritePre`) for most filetypes, with `c` and `cpp` disabled by default due to less standardized coding styles.
*   Lua files are formatted using `stylua`.
*   **Keybinding**: Press `<leader>f` to format the buffer asynchronously (`:ConformInfo` command is also available).

---

## 🔍 Search & Navigation

**The global leader key is set to `,` (comma)**. Multi-character keymaps are typically invoked by pressing the leader key followed by the sequence (e.g., `,ff`).

### Fuzzy Finder (Telescope)

**[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** is a powerful fuzzy finder for various tasks. It uses extensions like `fzf` for speed and `ui-select` for a dropdown theme.

**Keymaps for Telescope**:
*   `<leader>ff`: **[F]ind [f]iles**
*   `<leader>fg`: **[L]ive [g]rep**
*   `<leader>fb`: **[F]ind [b]uffers** (existing buffers)
*   `<leader>fh` / `<leader>sh`: **[F]ind [h]elp tags** / **[S]earch [H]elp**
*   `<leader>fs` / `/`: **[F]ind in current [s]buffer** (fuzzy search in current buffer with dropdown theme)
*   `<leader>sk`: **[S]earch [K]eymaps**
*   `<leader>ss`: **[S]earch [S]elect Telescope** builtins
*   `<leader>sw`: **[S]earch current [W]ord** (grep string)
*   `<leader>sd`: **[S]earch [D]iagnostics**
*   `<leader>sr`: **[S]earch [R]esume** last search
*   `<leader>s.`: **[S]earch Recent Files** (`.` for repeat)
*   `<space>`: **Find existing buffers**
*   `<leader>s/`: **[S]earch [/] in Open Files** (live grep in open files)
*   `<leader>sn`: **[S]earch [N]eovim files** (in Neovim config directory)

### Keybindings (Which-key & Custom Maps)

This configuration includes `folke/which-key.nvim` for keybinding hints. Custom keymaps are also defined for efficiency:

*   **Window Navigation**:
    *   `<C-h>`: Move focus to the left window
    *   `<C-l>`: Move focus to the right window
    *   `<C-j>`: Move focus to the lower window
    *   `<C-k>`: Move focus to the upper window
*   **Resize Splits**:
    *   `<C-Up>`: Increase window height (`:resize +2`)
    *   `<C-Down>`: Decrease window height (`:resize -2`)
    *   `<C-Left>`: Decrease window width (`:vertical resize -5`)
    *   `<C-Right>`: Increase window width (`:vertical resize +5`)
*   **Folding**:
    *   `h`: Close current fold (`zc`)
    *   `l`: Open current fold (`zo`)
*   **File/Buffer**:
    *   `<leader>rr`: **[R]un current file** (Python) or **toggle live-server** (HTML/JS)
    *   `<leader>v`: **[V]iew (`edit`) `$MYVIMRC`** (open your Neovim configuration file)
*   **LSP**:
    *   `grn`: LSP **[R]e[n]ame** (as listed above in LSP section)
    *   `q`: **Open diagnostic [Q]uickfix list** (as listed above in LSP section)
*   **Others**:
    *   `<Esc>`: **Clear search highlight**
    *   `<leader>uu`: **Toggle UndoTree**

---

## 🐙 Git Integration

This setup includes robust Git integration using **[tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)** and **[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**.

**Fugitive Commands and Keymaps**:
*   `Git`: Open Git status window
*   `Gdiffsplit`, `Gvdiffsplit`, `Gwrite`, `Gread`, `Gbrowse`: Additional Fugitive commands
*   `gs`: **Git status**
*   `gb`: **Git blame**
*   `gd`: **Git diff split right** (`:rightbelow vertical Gdiffsplit`)
*   **Gitsigns**: Shows additions (`+`), changes (`~`), and deletions (`_`) in the sign column.

---

## 🧰 Utility Plugins

*   **Undo Tree** (`mbbill/undotree`):
    *   Toggle with `UndotreeToggle` command or `<leader>uu` keymap.
    *   Configured with a layout showing tree and diff on the right, and a customizable width.
*   **Comment.nvim** (`numToStr/Comment.nvim`):
    *   `gcc`: **Toggle line comment**
    *   `gbc`: **Toggle block comment**
*   **todo-comments.nvim** (`folke/todo-comments.nvim`): Highlights `TODO`, `FIXME`, `NOTE`, `HACK`, `WARN`, `PERF`, `BUG`, `INFO` tags in comments for better visibility.
*   **nvim-colorizer.lua** (`norcalli/nvim-colorizer.lua`): Provides high-performance inline color highlighting (e.g., `#ff8800`).
*   **live-server.nvim** (`barrett-ruth/live-server.nvim`): Launches a local development server for HTML/CSS/JS projects. Configured with `live-server.cmd` for Windows compatibility.
*   **peek.nvim** (`toppair/peek.nvim`): Markdown preview functionality. Configured to use `msedge` as the application for preview. Custom user commands `PeekOpen` and `PeekClose` are provided.
*   **vim-tmux-navigator** (`christoomey/vim-tmux-navigator`): Enables seamless navigation between Neovim splits and tmux panes.
*   **vim-sleuth** (`tpope/vim-sleuth`): Automatically detects tabstop and shiftwidth settings based on the file content.
*   **vim-rhubarb** (`tpope/vim-rhubarb`): Provides GitHub integration for `vim-fugitive`.

---

## ⚙️ Core Neovim Settings

### General Display & Indentation

*   **Display**: Line numbers (`number`), relative line numbers (`relativenumber`), `unnamedplus` clipboard, no line wrapping (`wrap = false`), `termguicolors = true`. Configured scroll and sidescroll offsets, title enabled, tabline hidden, `showcmd`, and `hlsearch`.
*   **Indentation**: `cindent`, `autoindent`, `expandtab`, `tabstop=4`, `shiftwidth=4`, `softtabstop=4`.
*   **Search**: `ignorecase`, `smartcase`.
*   **Split Behavior**: Splits open below (`splitbelow`) and to the right (`splitright`), with cursor kept in place (`splitkeep = "cursor"`).
*   **Mouse**: Mouse interaction is disabled by default (`mouse = ""`).
*   **Leader Key**: **The global leader key is explicitly set to `,` (comma)**. The local leader key is also set to `,`. This means that many multi-character custom keymaps (like `<leader>ff` for find files) are invoked by pressing `,` followed by the key sequence.

### Temporary & Undo Files

*   **Persistent Undo**: Enabled (`undofile = true`).
*   **Undo Directory**: Undo files are stored in `stdpath("data")/undo`. The directory is automatically created if it doesn't exist.
*   **Cleanup**: A cleanup function `core.cleanupUndo.cleanup(120)` automatically deletes undo files older than 120 days.
*   **Temporary Files**: Swap, undo, and backup files are configured to use a temporary directory identified by `$TEMP` (or a default path on Windows).

### Folding

*   **Method**: `foldmethod = "expr"` for Treesitter integration.
*   **Level**: `foldlevel = 99` (most folds open by default), `foldenable = true`.
*   **Custom Fold Text**: Uses a custom `MyFoldText()` function to display "▶ [line content] ... ([count] lines)".
*   **Keymaps**: `h` to close a fold (`zc`) and `l` to open a fold (`zo`).

### Windows-Specific Configuration

*   **Shell**: Configured to use **Git Bash** as the default shell: `opt.shell = [["C:/Program Files/Git/bin/bash.exe"]]`.
*   **Shell Flags**: `opt.shellcmdflag = "-c"`, `opt.shellquote = ""`, `opt.shellxquote = ""`.

### Autocommands

*   **Yank Highlighting**: Highlights text visually when it is yanked (copied) (`TextYankPost` event).
*   **Auto Fold Saving/Loading**: Automatically saves folds when a buffer is left (`BufWinLeave`) and loads them when a buffer is entered (`BufWinEnter`), but only for actual files, not temporary buffers.
*   **Fugitive Syntax**: Sets local syntax to `git` automatically for `fugitive` filetypes.
*   **Git Abbreviation**: `cabbrev git Git` for convenience.

---

