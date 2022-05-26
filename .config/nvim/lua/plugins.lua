-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]] -- TODO???

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'lewis6991/gitsigns.nvim' -- TODO: replace with 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'rhysd/git-messenger.vim'
  use 'junegunn/fzf' -- TODO: how do I do this: `{ 'do': { -> fzf#install() } }`
  use 'junegunn/fzf.vim'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'chrisbra/unicode.vim'
  use 'kylelaker/riscv.vim'
  -- use 'liuchengxu/vim-which-key'
  use 'liuchengxu/vista.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-characterize'
  use 'tommcdo/vim-lion'

  use 'neovim/nvim-lspconfig'
  -- rust
  use 'simrat39/rust-tools.nvim'

  use 'rafaelsq/nvim-goc.lua'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'kabouzeid/nvim-lspinstall'
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
  use 'nvim-lua/plenary.nvim'

  use 'stevearc/dressing.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'iamcco/markdown-preview.nvim' , run = ':call mkdp#util#install()' }

  -- colorschemes
  use 'ja-he/kurzzug'
  use 'Shatur/neovim-ayu'
  use 'fcpg/vim-fahrenheit'
end)
