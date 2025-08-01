return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Gruvbox
  use 'sainnhe/gruvbox-material'

  -- Navigation integration with tmux
  use 'christoomey/vim-tmux-navigator'

  -- Commments
  use 'preservim/nerdcommenter'

  -- Git
  use 'tpope/vim-fugitive'
  use {'lewis6991/gitsigns.nvim'}

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Statusline
  use {'nvim-lualine/lualine.nvim'}

  -- File Explorer
  use {"mikavilpas/yazi.nvim"}

  -- Completion
  use {
    'saghen/blink.cmp',
    requires = { 'rafamadriz/friendly-snippets' },

    config = function()
      require('blink.cmp').setup({
        keymap = { preset = 'default' },

        completion = {
          documentation = { auto_show = true },
        },

        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy = {
          implementation = "lua",
        },
      })
    end
  }
end)
