return require('packer').startup(function()
  --> Packer can manage itself
  use 'wbthomason/packer.nvim'

  --> themes
  use 'tanvirtin/monokai.nvim'

  --> LSP
  use 'neovim/nvim-lspconfig' 
  
  --> autocomplete
  use 'hrsh7th/nvim-cmp'		-- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'		-- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'	-- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'		-- Snippets plugin

  --> telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  --> lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  
  --> treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  --> markdown preview
  use 'iamcco/markdown-preview.nvim' 
end)

