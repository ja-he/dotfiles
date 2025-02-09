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

let config_home = stdpath('config')

execute 'source ' . config_home . '/settings.vim'
" this sets mapleader BEFORE lazy is loaded!
execute 'source ' . config_home . '/binds.vim'

lua require("ztf.au")

lua << EOF
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    print("installing lazy at '"..lazypath.."'")
    output = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
    print("lazy-install output: '" .. output .. "'")
  end
  vim.opt.rtp:prepend(lazypath)
  require("plugins")
EOF

lua require('ztf.treesitter')

lua require('ztf.colorscheme').auto().apply()

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
