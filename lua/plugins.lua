return require('packer').startup(function()
	--> telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--> floaterm
	use 'voldikss/vim-floaterm'

	--> Packer
	use 'wbthomason/packer.nvim'

	--> themes
	use 'tanvirtin/monokai.nvim'

	--> nvim-treesitter
	use 'nvim-treesitter/nvim-treesitter'

	--> lspconfig
	use 'neovim/nvim-lspconfig' 

	--> rust
	use 'simrat39/rust-tools.nvim'

	--> Completion
    	use 'hrsh7th/nvim-cmp' 
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'                             
	use 'hrsh7th/cmp-path'                              
	use 'hrsh7th/cmp-buffer'                            
	use 'hrsh7th/vim-vsnip' 

	--> Mason    
	use 'williamboman/mason.nvim'    
	use 'williamboman/mason-lspconfig.nvim'

	--> lualine
	use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use 'puremourning/vimspector'

end)
