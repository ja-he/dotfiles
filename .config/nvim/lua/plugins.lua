-- vim:foldmethod=indent

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]] -- TODO???

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'rhysd/git-messenger.vim'
  use 'junegunn/fzf' -- TODO: how do I do this: `{ 'do': { -> fzf#install() } }`
  use 'junegunn/fzf.vim'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'lervag/vimtex'
  use 'chrisbra/unicode.vim'
  use 'kylelaker/riscv.vim'
  -- use 'liuchengxu/vim-which-key'
  use 'liuchengxu/vista.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-characterize'
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'tommcdo/vim-lion'

  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  -- rust
  use 'simrat39/rust-tools.nvim'
  -- java 🤮
  use 'mfussenegger/nvim-jdtls'

  use { 'ja-he/nvim-goc.lua', branch = 'fix-deprecated-hi-link' }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- use 'folke/lua-dev.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'tweekmonster/startuptime.vim'
  use 'voldikss/vim-floaterm'
  use 'metakirby5/codi.vim'
  use 'dstein64/nvim-scrollview'
  use 'rktjmp/lush.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'lewis6991/spellsitter.nvim'
  use 'nvim-lua/plenary.nvim'

  use({ 'https://github.com/nat-418/boole.nvim',
    config = function()
      require('boole').setup({
        mappings = { increment = '<c-a>', decrement = '<c-x>' },
        -- User defined loops
        additions = {
          { 'feat', 'fix', 'refactor', 'style', 'doc', 'test', 'ci', 'chore' },
        },
      })
    end
  })

  use 'stevearc/dressing.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  }

  use { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()' }

  use 'pocco81/true-zen.nvim'

  -- colorschemes
  use 'ja-he/kurzzug'
  use 'Shatur/neovim-ayu'
  use 'fcpg/vim-fahrenheit'

  use 'Eandrju/cellular-automaton.nvim'

  use 'NoahTheDuke/vim-just'
  use 'IndianBoy42/tree-sitter-just'

  use 'git@github.com:ja-he/mediate.nvim.git'
end)
