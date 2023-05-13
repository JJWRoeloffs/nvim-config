vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }
    use {{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}}
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'nvim-treesitter/playground'}
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    use {
        'folke/todo-comments.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
    -- The scala LSP wants to be installed like this
    use {
        'scalameta/nvim-metals',
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "mfussenegger/nvim-dap" },
        }
    }
    use {
        'sindrets/diffview.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
    use {
      'itchyny/lightline.vim',
      requires = {
        use { 'tpope/vim-fugitive' },
      }
    }

    use { 'nvim-tree/nvim-tree.lua' }
    use { 'folke/trouble.nvim' }
    use { 'mg979/vim-visual-multi' }
    use { 'ggandor/leap.nvim' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }
end)
