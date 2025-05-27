vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- theme
  use { 'catppuccin/nvim', as = 'catppuccin' }
  -- use 'folke/tokyonight.nvim'
  
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                          , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- syntax highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- git
  use 'tpope/vim-fugitive'

  -- commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- lsp
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',      -- LSP source
      'hrsh7th/cmp-buffer',        -- buffer words
      'hrsh7th/cmp-path',          -- filesystem paths
      'hrsh7th/cmp-cmdline',       -- vim command-line
      'L3MON4D3/LuaSnip',          -- snippet engine
      'saadparwaiz1/cmp_luasnip',  -- snippet completions
    },
  }

end)
