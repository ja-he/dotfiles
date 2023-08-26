-- vim:foldmethod=indent

local plugins = {

  { 'nvim-lua/plenary.nvim' },

  -- git
  'tpope/vim-fugitive',
  { 'lewis6991/gitsigns.nvim', config = function() require("ztf.configure.gitsigns") end },
  { 'rhysd/git-messenger.vim', config = function() vim.cmd('source ~/.config/nvim/configure/git-messenger.vim') end },

  -- stuff?
  'vim-pandoc/vim-pandoc-syntax',
  'chrisbra/unicode.vim',
  'kylelaker/riscv.vim',
  { 'norcalli/nvim-colorizer.lua', config = function() require('ztf.configure.nvim-colorizer') end },
  { 'numToStr/Comment.nvim',       config = function() require("ztf.configure.comment") end },
  'tpope/vim-surround',
  'tpope/vim-characterize',
  'tommcdo/vim-lion',

  'neovim/nvim-lspconfig',
  'mfussenegger/nvim-dap',
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
    config = function() require("ztf.configure.dapui") end,
  },
  -- rust
  {
    'simrat39/rust-tools.nvim',
    lazy = true,
    ft = 'rust',
    config = function() require 'ztf.configure.rust-tools' end,
    dependencies = { 'mfussenegger/nvim-dap' , 'neovim/nvim-lspconfig' },
  },
  -- java 🤮
  { 'mfussenegger/nvim-jdtls',  lazy = true, ft = 'java' },
  -- go
  {
    'leoluz/nvim-dap-go',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = 'go',
    config = function() require("ztf.configure.dap-go") end,
  },
  {
    'rafaelsq/nvim-goc.lua',
    lazy = true,
    config = function() require("ztf.configure.nvim-goc") end,
  },
  -- 'folke/lua-dev.nvim',

  { 'hrsh7th/nvim-cmp',         config = function() require("ztf.configure.nvim-cmp") end },
  { 'hrsh7th/cmp-nvim-lsp',     dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-buffer',       dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-path',         dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-cmdline',      dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'saadparwaiz1/cmp_luasnip', dependencies = { 'L3MON4D3/LuaSnip', 'hrsh7th/nvim-cmp' }, },

  -- luasnip
  { 'L3MON4D3/LuaSnip',         config = function() require("ztf.configure.luasnip") end },

  -- DB viewing
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = { 'tpope/vim-dadbod', lazy = true },
    lazy = true,
    cmd =
    'DBUIToggle'
  },

  { 'github/copilot.vim',              lazy = true,                                                 cmd = 'Copilot' },
  {
    'voldikss/vim-floaterm',
    config = function() vim.cmd('source ~/.config/nvim/configure/floaterm.vim') end,
  },
  {
    'dstein64/nvim-scrollview',
    lazy = true,
    cmd =
    'ScrollViewToggle'
  },
  { 'rktjmp/lush.nvim' },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-treesitter/playground',      dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'lewis6991/spellsitter.nvim',      config = function() require("ztf.configure.spellsitter") end },

  {
    'https://github.com/nat-418/boole.nvim',
    config = function()
      require('boole').setup({
        mappings = { increment = '<c-a>', decrement = '<c-x>' },
        -- User defined loops
        additions = {
          { 'feat', 'fix', 'refactor', 'style', 'doc', 'test', 'ci', 'chore' },
        },
      })
    end
  },

  -- searching
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require("ztf.configure.telescope") end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && '
        .. 'cmake --build build --config Release && '
        .. 'cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    config = function() vim.cmd("source ~/.config/nvim/configure/fzf.vim") end,
  },

  -- ui stuff
  'stevearc/dressing.nvim',
  { 'pocco81/true-zen.nvim',            config = function() require("ztf.configure.true-zen") end },
  { 'nvim-lualine/lualine.nvim',        config = function() require("ztf.configure.lualine") end },

  -- colorschemes
  { 'git@github.com:ja-he/kurzzug.git', dependencies = 'rktjmp/lush.nvim' },
  { 'Shatur/neovim-ayu', },
  { 'fcpg/vim-fahrenheit', },

  -- play around
  {
    'Eandrju/cellular-automaton.nvim',
    lazy = true,
    cmd =
    'CellularAutomaton'
  },

  'NoahTheDuke/vim-just',
  'IndianBoy42/tree-sitter-just',

  -- { 'iamcco/markdown-preview.nvim', build = ':call mkdp#util#install()' },

  'lervag/vimtex',
  'kaarmu/typst.vim',

  'git@github.com:ja-he/mediate.nvim.git',
  {
    'git@github.com:ja-he/heat.nvim.git',
    config = function() require("ztf.configure.heat") end,
  },

  { 'tweekmonster/startuptime.vim', lazy = true, cmd = 'StartupTime' },

}

require('lazy').setup(plugins)
