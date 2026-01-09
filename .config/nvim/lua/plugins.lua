-- Build hooks for plugins that need post-install steps
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({'make'}, {cwd = ev.data.path}):wait()
    elseif name == 'markdown-preview.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({'npx', '--yes', 'yarn', 'install'}, {cwd = ev.data.path .. '/app'}):wait()
    end
  end,
})

vim.pack.add({
  -- Colorscheme
  "https://github.com/sainnhe/gruvbox-material",

  -- Navigation integration with tmux
  "https://github.com/christoomey/vim-tmux-navigator",

  -- Comments
  "https://github.com/preservim/nerdcommenter",

  -- Git
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/lewis6991/gitsigns.nvim",

  -- Picker
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",

  -- Statusline
  "https://github.com/nvim-lualine/lualine.nvim",

  -- Scrollbar
  "https://github.com/lewis6991/satellite.nvim",

  -- Markdown
  "https://github.com/iamcco/markdown-preview.nvim",

  -- Completion (dependencies first)
  "https://github.com/saghen/blink.cmp",
  "https://github.com/github/copilot.vim"
})
