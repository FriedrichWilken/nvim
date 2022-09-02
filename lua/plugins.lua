return require('packer').startup(function()

    --> indent-blankline
    require("packer").startup(function()
        use "lukas-reineke/indent-blankline.nvim"
    end)


    --> Packer can manage itself
    use 'wbthomason/packer.nvim'

    --> themes
    use 'tanvirtin/monokai.nvim'

    --> LSP
    use 'neovim/nvim-lspconfig' 

    --> floating 
    --todo how to use this?
    --use 'ray-x/lsp_signature.nvim'


    --> autocomplete
    use 'hrsh7th/nvim-cmp'          -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'      -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'  -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'          -- Snippets plugin

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

    --> vim-go
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

    --> rust-tools
    use 'simrat39/rust-tools.nvim'

    --> autopair
    use 'windwp/nvim-autopairs'

    --> vim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

end)
