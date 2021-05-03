require('lazy').setup({
    'tpope/vim-sensible',
    'airblade/vim-rooter',

    -- Search
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = require('plugins.fzf-lua'),
    },
    {
        'wincent/loupe',
        config = require('plugins.loupe'),
    },
    {
        'windwp/nvim-spectre',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    -- Navigation
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
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = require('plugins.nvim-tree'),
    },
    'nacro90/numb.nvim',

    -- Visual
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
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
        config = require('plugins.indent-blankline'),
    },
    'windwp/nvim-ts-autotag',
    'p00f/nvim-ts-rainbow',
    {
        'uga-rosa/ccc.nvim',
        config = require('plugins.ccc'),
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
        config = require('plugins.nvim-ufo'),
    },
    {
        name = 'lsp_lines',
        url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = require('plugins.lsp_lines'),
    },
    'folke/lsp-colors.nvim',
    'xiyaowong/virtcolumn.nvim',

    -- Syntax
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
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- Editor
    'gpanders/editorconfig.nvim',
    'junegunn/vim-easy-align',
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
    {
        'booperlv/nvim-gomove',
        config = require('plugins.nvim-gomove'),
    },
    'romainl/vim-cool',
    'tpope/vim-repeat',
    'AckslD/nvim-trevJ.lua',
    'wellle/targets.vim',
    'jiangmiao/auto-pairs',
    {
        'mhartington/formatter.nvim',
        config = require('plugins.formatter'),
    },
    {
        'ziontee113/color-picker.nvim',
        config = require('plugins.color-picker'),
    },
    'lewis6991/spellsitter.nvim',
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
    {
        'klen/nvim-config-local',
        config = require('plugins.nvim-config-local'),
    },

    -- Tools
    {
        'dhruvasagar/vim-table-mode',
        config = require('plugins.vim-table-mode'),
    },
    'tpope/vim-fugitive',
    'tpope/vim-unimpaired',
    {
        'simrat39/symbols-outline.nvim',
        config = require('plugins.symbols-outline'),
    },
    'itchyny/calendar.vim',
    {
        'mfussenegger/nvim-dap',
        config = require('plugins.nvim-dap'),
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = require('plugins.nvim-dap-ui'),
    },
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
        branch = 'stable',
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

    -- LSP
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
        },
        config = require('plugins.mason'),
    },

    {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    },
})
