return require('packer').startup(function()
    --> auto-pair
    use 'jiangmiao/auto-pairs'
	--> telescope
	use {
		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
    -- install fd https://github.com/sharkdp/fd#installation 
    use { "nvim-telescope/telescope-file-browser.nvim" } 

    --> nvim-web-devicons
    use 'nvim-tree/nvim-web-devicons'

    --> fterm (floating terminal)
    use 'numToStr/FTerm.nvim'

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
