local g = vim.g
local o = vim.o

-- Treesitter
require('nvim-treesitter').setup {
  ensure_installed = { "c", "cpp", "javascript", "typescript", "tsx", "go", "rust", "lua", "markdown", "markdown_inline", "json", "html", "css", "bash", "yaml", "toml" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Colorscheme
g.gruvbox_material_background='hard'
g.gruvbox_contrast_dark='hard'

vim.cmd [[
colorscheme gruvbox-material
]]

-- Fuzzy finder
require('telescope').setup({
  defaults = {
    -- configure to use ripgrep
    vimgrep_arguments = {
      "rg",
      "--follow",        -- Follow symbolic links
      "--hidden",        -- Search for hidden files
      "--no-heading",    -- Don't group matches by each file
      "--with-filename", -- Print the file path with the matched lines
      "--line-number",   -- Show line numbers
      "--column",        -- Show column numbers
      "--smart-case",    -- Smart case search
      "--word-regexp",   -- Full word
      -- Exclude some patterns from search
      "--glob=!**/.git/*",
      "--glob=!**/.idea/*",
      "--glob=!**/.vscode/*",
      "--glob=!**/build/*",
      "--glob=!**/dist/*",
      "--glob=!**/yarn.lock",
      "--glob=!**/package-lock.json",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      -- when not included or specified in .gitignore
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
    },
  },
})

require('telescope').load_extension('fzf')

-- Git modifications sign
require('gitsigns').setup()

-- Statusline
require('lualine').setup()

-- Markdown Preview
g.mkdp_auto_start = 0

-- Completion (blink.cmp)
require('blink.cmp').setup({
  keymap = { preset = 'default' },

  completion = {
    documentation = { auto_show = true },
  },

  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },

  fuzzy = {
    implementation = "lua",
  },
})

