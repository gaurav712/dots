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

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)
