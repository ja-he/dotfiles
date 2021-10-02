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

source ~/.config/nvim/settings.vim
source ~/.config/nvim/binds.vim
source ~/.config/nvim/au.vim

lua require("plugins")

source ~/.config/nvim/colorscheme.vim

lua require("ztf.lsp")
lua require('ztf.treesitter')

lua require("ztf.configure.nvim-cmp")
lua require('ztf.configure.nvim-colorizer')
lua require('ztf.configure.nvim-tree')
source ~/.config/nvim/configure/which-key.vim
source ~/.config/nvim/configure/floaterm.vim
source ~/.config/nvim/configure/ultisnips.vim
source ~/.config/nvim/configure/fzf.vim
source ~/.config/nvim/configure/git-messenger.vim
source ~/.config/nvim/configure/pandoc.vim
source ~/.config/nvim/configure/markdown-preview.vim


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
