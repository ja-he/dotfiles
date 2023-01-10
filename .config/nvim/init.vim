" __________________________________________________________________
"                                      ___
"             ___        ___          /__/\
"            /__/\      /  /\        |  |::\
"            \  \:\    /  /:/        |  |:|:\
"             \  \:\  /__/::\      __|__|:|\:\
"         ___  \__\:\ \__\/\:\__  /__/::::| \:\
"        /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
"        \  \:\|  |:|     \__\::/  \  \:\
"         \  \:\__|:|     /__/:/    \  \:\
"         .\__\::::/      \__\/      \  \:\
"              ~~~~                   \__\/RC
"              ______   ______   ______
"           by/\___  \ /\__  _\ /\  ___\
"             \/_/  /__\/_/\ \/ \ \  __\
"               /\_____\  \ \_\  \ \_\
"               \/_____/   \/_/   \/_/
" __________________________________________________________________

let configpath = stdpath('config')

exec 'source' configpath . '/settings.vim'
exec 'source' configpath . '/binds.vim'
exec 'source' configpath . '/au.vim'

lua require("plugins")
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

exec 'source' configpath . '/colorscheme.vim'

lua require("ztf.lsp")
lua require('ztf.treesitter')

lua require("ztf.configure.nvim-cmp")
lua require('ztf.configure.nvim-colorizer')
lua require("ztf.configure.comment")
lua require("ztf.configure.gitsigns")
lua require("ztf.configure.neogit")
lua require("ztf.configure.telescope")
lua require("ztf.configure.luasnip")
lua require("ztf.configure.nvim-goc")
lua require("ztf.configure.spellsitter")
lua require("ztf.configure.true-zen")
" source ~/.config/nvim/configure/which-key.vim
exec 'source' configpath . '/configure/floaterm.vim'
exec 'source' configpath . '/configure/ultisnips.vim'
exec 'source' configpath . '/configure/fzf.vim'
exec 'source' configpath . '/configure/git-messenger.vim'
exec 'source' configpath . '/configure/pandoc.vim'
exec 'source' configpath . '/configure/markdown-preview.vim'

" ----- TODO: place somewhere sensible: ----------------------------------------

let g:netrw_browsex_viewer="feh"
let g:tex_flavor = "latex"

function! Conceal()
  setlocal conceallevel=2
  setlocal concealcursor-=n
endfunction
function! NoConceal()
  setlocal conceallevel=0
endfunction

" make vim check for a local-directory .vimrc file
" as I want this to override my default settings (settings.vim), binds, etc. it's at the end here
set exrc
