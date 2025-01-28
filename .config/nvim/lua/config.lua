local g = vim.g
local o = vim.o

o.fileencoding = 'utf-8' -- Use UTF-8 encoding for files
o.fileformats = 'unix,dos,mac' -- Automatically detect line endings

-- Enable 24-bit RGB color in the terminal (for better colors)
o.termguicolors = true

-- Map the <leader> key to ';' (commonly used as a prefix for custom shortcuts)
g.mapleader = ';'
g.maplocalleader = ';'

-- Allow switching between buffers without saving the current buffer
o.hidden = true

-- Editor UI options
o.number = true           -- Show line numbers
o.numberwidth = 5         -- Set the width of the number column to 5
o.relativenumber = true   -- Show relative line numbers (useful for navigation)
o.signcolumn = 'yes:2'    -- Always show a 2-column wide sign column (for git, diagnostics, etc.)
o.cursorline = true       -- Highlight the current line
o.colorcolumn = '80'      -- Highlight column 80 (useful for line length limits)
o.hlsearch = true         -- Highlight search matches
o.incsearch = true        -- Show matches as you type

-- Editing experience options
o.expandtab = true        -- Use spaces instead of tabs
-- o.smarttab = true       -- (Commented out) Insert spaces when pressing <Tab> in insert mode
o.cindent = true          -- Enable C-style indentation
-- o.autoindent = true     -- (Commented out) Automatically indent new lines
o.wrap = true             -- Wrap long lines
o.textwidth = 300         -- Maximum width for text wrapping (set very high)
o.tabstop = 2             -- Number of spaces for a tab character
o.shiftwidth = 0          -- Use the value of 'tabstop' for auto-indentation
o.softtabstop = -1        -- If negative, use the value of 'shiftwidth' for <Tab>/<BS>
o.list = true             -- Show invisible characters
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂' -- Define how invisible characters are displayed
o.scrolloff = 8           -- Minimum number of lines to keep above and below the cursor
o.sidescrolloff = 8       -- Minimum number of columns to keep left and right of the cursor

-- Enable mouse support in all modes
o.mouse = 'a'

-- Synchronize Neovim clipboard with the system clipboard
o.clipboard = 'unnamedplus'

-- Make searching case-insensitive unless a capital letter is used or /C is specified
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false          -- Do not create backup files
o.writebackup = false     -- Do not keep a backup while overwriting a file
o.undofile = false        -- Do not save undo history to a file
o.swapfile = false        -- Disable swap files

-- Set the command-line history to remember the last 50 commands
o.history = 50

-- Split windows to the right and below by default
o.splitright = true
o.splitbelow = true

-- Reduce the time Neovim waits for a change (in milliseconds)
o.updatetime = 300

-- Highlight on yank
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
  augroup END
]])

-- Autocomplete
o.completeopt = 'menuone,noinsert,noselect' -- Better completion menu experience
o.shortmess = o.shortmess .. 'c' -- Avoid showing extra messages during completion

