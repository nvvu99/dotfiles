require('lazy').setup({
    'tpope/vim-sensible',
    'airblade/vim-rooter',

    -- LSP
    {
        {
            'williamboman/mason.nvim',
            dependencies = {
                'williamboman/mason-lspconfig.nvim',
                'neovim/nvim-lspconfig',
                'b0o/schemastore.nvim',
                'folke/neodev.nvim',
                'folke/neoconf.nvim',
            },
            config = require('plugins.mason'),
        },
    },

    -- Diagnostics
    {
        {
            'folke/trouble.nvim',
            requires = 'nvim-tree/nvim-web-devicons',
        },
        {
            name = 'lsp_lines',
            url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
            config = require('plugins.lsp_lines'),
        },
    },

    -- Completion
    {
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
                'lukas-reineke/cmp-under-comparator',
                'hrsh7th/cmp-nvim-lsp-signature-help',
                'onsails/lspkind.nvim',
                'saadparwaiz1/cmp_luasnip',
                { 'L3MON4D3/LuaSnip', tag = 'v1.1.0' },
                'rafamadriz/friendly-snippets',
            },
            config = require('plugins.nvim-cmp'),
        },
        'windwp/nvim-ts-autotag',
        {
            'Exafunction/codeium.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'hrsh7th/nvim-cmp',
            },
            config = require('plugins.codeium'),
        },
        {
            'dpayne/CodeGPT.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'MunifTanjim/nui.nvim',
            },
            config = require('plugins.codegpt'),
        },
    },

    -- Syntax
    {
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            config = require('plugins.nvim-treesitter'),
        },
        'nvim-treesitter/nvim-treesitter-refactor',
        {
            'nvim-treesitter/nvim-treesitter-context',
            config = require('plugins.nvim-treesitter-context'),
        },
        'm-demare/hlargs.nvim',
    },

    -- Search
    {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.3',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = require('plugins.telescope'),
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        {
            'fdschmidt93/telescope-egrepify.nvim',
            dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        },
        {
            'wincent/loupe',
            config = require('plugins.loupe'),
        },
        {
            'windwp/nvim-spectre',
            dependencies = 'nvim-lua/plenary.nvim',
        },
    },

    -- Navigation
    {
        {
            'phaazon/hop.nvim',
            branch = 'v2',
            config = require('plugins.hop'),
        },
        {
            'max397574/better-escape.nvim',
            config = require('plugins.better-escape'),
        },
        {
            'kyazdani42/nvim-tree.lua',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = require('plugins.nvim-tree'),
        },
        'nacro90/numb.nvim',
    },

    -- Visual
    {
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = require('plugins.lualine'),
        },
        {
            'karb94/neoscroll.nvim',
            config = require('plugins.neoscroll'),
        },
        'mhinz/vim-signify',
        {
            'Mofiqul/dracula.nvim',
            config = require('plugins.dracula'),
        },
        {
            'lukas-reineke/indent-blankline.nvim',
            main = 'ibl',
            config = require('plugins.indent-blankline'),
        },
        'HiPhish/rainbow-delimiters.nvim',
        {
            'uga-rosa/ccc.nvim',
            config = require('plugins.ccc'),
        },
        {
            'kevinhwang91/nvim-ufo',
            dependencies = { 'kevinhwang91/promise-async' },
            config = require('plugins.nvim-ufo'),
        },
        'xiyaowong/virtcolumn.nvim',
        {
            'utilyre/barbecue.nvim',
            name = 'barbecue',
            version = '*',
            dependencies = {
                'SmiteshP/nvim-navic',
                'nvim-tree/nvim-web-devicons', -- optional dependency
            },
            config = require('plugins.barbecue'),
        },
    },

    -- Editor
    {
        'gpanders/editorconfig.nvim',
        {
            'booperlv/nvim-gomove',
            config = require('plugins.nvim-gomove'),
        },
        'romainl/vim-cool',
        {
            'jiangmiao/auto-pairs',
            config = require('plugins.auto-pairs'),
        },
        {
            'mhartington/formatter.nvim',
            config = require('plugins.formatter'),
        },
        {
            'mizlan/iswap.nvim',
            config = require('plugins.iswap'),
        },
        {
            'filipdutescu/renamer.nvim',
            branch = 'master',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = require('plugins.renamer'),
        },
    },

    -- Debugging
    {
        {
            'mfussenegger/nvim-dap',
            config = require('plugins.nvim-dap'),
        },
        {
            'rcarriga/nvim-dap-ui',
            dependencies = { 'mfussenegger/nvim-dap' },
            config = require('plugins.nvim-dap-ui'),
        },
        {
            'theHamsta/nvim-dap-virtual-text',
            dependencies = { 'mfussenegger/nvim-dap' },
        },
        {
            'przepompownia/nvim-dap-tab',
            dependencies = { 'mfussenegger/nvim-dap' },
        },
    },

    -- Tools
    {
        {
            'dhruvasagar/vim-table-mode',
            config = require('plugins.vim-table-mode'),
        },
        'tpope/vim-fugitive',
        {
            'simrat39/symbols-outline.nvim',
            config = require('plugins.symbols-outline'),
        },
        'itchyny/calendar.vim',
        'ludovicchabant/vim-lawrencium',
        'jghauser/mkdir.nvim',
        {
            'f-person/git-blame.nvim',
            config = require('plugins.git-blame'),
        },
        {
            'akinsho/toggleterm.nvim',
            config = require('plugins.toggleterm'),
        },
        {
            'echasnovski/mini.nvim',
            version = '*',
            config = require('plugins.mini'),
        },
        'JoosepAlviste/nvim-ts-context-commentstring',
        'folke/todo-comments.nvim',
        {
            'NTBBloodbath/rest.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = require('plugins.rest'),
        },
        { 'numtostr/BufOnly.nvim', cmd = 'BufOnly' },
        {
            'niuiic/translate.nvim',
            dependencies = { 'niuiic/core.nvim' },
        },
    },

    -- Workspaces
    {
        {
            'rmagatti/auto-session',
            config = require('plugins.auto-session'),
        },
        {
            'natecraddock/workspaces.nvim',
            config = require('plugins.workspaces'),
        },
    },
})
