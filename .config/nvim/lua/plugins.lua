-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]] -- TODO???

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-signify' -- TODO: replace with 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'rhysd/git-messenger.vim'
  use 'junegunn/fzf' -- TODO: how do I do this: `{ 'do': { -> fzf#install() } }`
  use 'junegunn/fzf.vim'
  use 'SirVer/ultisnips'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'chrisbra/unicode.vim'
  use 'kylelaker/riscv.vim'
  -- use 'liuchengxu/vim-which-key'
  use 'liuchengxu/vista.vim'
  use 'norcalli/nvim-colorizer.lua'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'kabouzeid/nvim-lspinstall'
  -- use 'folke/lua-dev.nvim'

  use 'tweekmonster/startuptime.vim'
  use 'voldikss/vim-floaterm'
  use 'metakirby5/codi.vim'
  use 'dstein64/nvim-scrollview'
  use 'rktjmp/lush.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-tree.lua'

  use { 'iamcco/markdown-preview.nvim' , run = ':call mkdp#util#install()' }

  -- colorschemes
  use 'ja-he/kurzzug'
  use 'Shatur/neovim-ayu'
  use 'fcpg/vim-fahrenheit'
end)
