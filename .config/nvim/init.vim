" __________________________________________________________________
"
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
"
"
"
"           CONTENTS:
"               - general settings
"               - interface settings
"               - appearance
"               - files etc.
"               - behaviour
"               - binds
"               - plugins
"
" __________________________________________________________________

" --------------------
"   GENERAL SETTINGS
" --------------------

  " sets the lines of history, that vim will remember
    set history=500

  " enable filetype plugins
    filetype plugin on
    filetype indent on

  " set to automatically read if a file was externally changed
    set autoread

  " fixing the capital :W human error
    command W w
    command Q q

  " use the global clipboard
    set clipboard=unnamedplus

  " make vim check for a local-directory .vimrc file
    set exrc

  " turn off backup, since it's annoying
    set nobackup
    set nowb
    set noswapfile

  " open files at last position
  " (the mark " is the position last closed at)
      autocmd BufReadPost *
           \ if line("'\"") > 0 && line("'\"") <= line("$") |
           \   exe "normal! g`\"" |
           \ endif

" __________________________________________________________________

" ----------------------
"   INTERFACE SETTINGS
" ----------------------

  " show line numbers (relative w/ current line showing actual
  " number)
    set number
    set relativenumber
" Presentation Settings 
set mouse=a
"set norelativenumber

  " color columns at the 69th and 81st column thanks to Damian
  " Conway
    set colorcolumn=81

  " indicate the current line
    set cursorline

  " predictive command menu (visualization)
    set wildmenu

  " show current position
    set ruler

  " command bar height
    set cmdheight=2

  " adjusting backspace behaviour
    set backspace=eol,start,indent  "allows backspacing over these
    " There is an option 'whichwrap' allowing to specify which keys
    " wrap lines. You could specify h and l to make these wrap if
    " going right at the end (or left at the beginning) of a line. I
    " don't like this behaviour.

  " ignore case in searches
    set ignorecase
  " still prioritize though
    set smartcase
  " preview results while typing search
    set incsearch

  " highlight search results
    set hlsearch

  " show matching brackets, when on indicator
    set showmatch

  " always show the status line
    set laststatus=2

" __________________________________________________________________

" --------------
"   APPEARANCE
" --------------

  " syntax highlighting
    syntax on

  " wrap lines
    set nowrap

  " let wrapping (if enabled by `set wrap`) be at on word level
    set linebreak

  " let linewrap respect indentation
    set breakindent

  " show spaces, tabs, etc with other characters
    set list
    set listchars=tab:\>\ ,trail:·,extends:…
   "set listchars=tab:│\ ,trail:·,extends:…,nbsp=+


  " use 24-bit RGB colors
    set termguicolors
  " set the colorscheme to my preferred colorscheme
  "  colorscheme monochrome-light

" __________________________________________________________________

" -------------
"   BEHAVIOUR
" -------------

  " indenting behaviour
    set autoindent  " automatically indent based on pre-/successors
    set smartindent " indent smartly (in C style langs)

  " tabs and spaces
    set expandtab     " use spaces when you press TAB
    set shiftwidth=2  " insert two spaces per TAB-press
    set tabstop=2     " display tabs as two-wide
    set softtabstop=2 " delete the 2 spaces of a tab with backspace

  " UTF-8 standard encoding
    set encoding=utf8

  " set no max textwidth by default (for coding)
    set textwidth=0

  " enable the mouse in diff mode
    if &diff
      set mouse=a
      set colorcolumn=0
    endif

set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noselect

  " assume latex files are 'latex' not 'plaintex'
    let g:tex_flavor = "latex"

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" __________________________________________________________________


" ---------
"   PLUG
" ---------

    call plug#begin()
    Plug 'lifepillar/vim-colortemplate'
    Plug 'vimwiki/vimwiki'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'rhysd/git-messenger.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
"   Plug 'SirVer/ultisnips'
"   Plug 'honza/vim-snippets'
"   Plug 'vim-pandoc/vim-pandoc'
"   Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'chrisbra/unicode.vim'
    Plug 'kylelaker/riscv.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'liuchengxu/vista.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    " add the lsp plugins for nvim 0.5
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'lervag/vimtex'
    call plug#end()

let g:colortemplate_no_mappings = 1

let mono_transp_bg = 1
colorscheme mono

  " git-messenger settings
    let g:git_messenger_always_into_popup = v:true

  " disable icons (which our font doesnt render right) in vista
    let g:vista#renderer#enable_icon = 0

" ... [ <size> , <contents preview toggle keymapping> ]
let g:fzf_preview_window = [ 'up:75%', 'ctrl-/']

" -----------
"   VIMWIKI
" -----------

    let g:vimwiki_list =
      \ [
        \ {'path': '~/md_notes/'
          \ ,'syntax': 'markdown'
          \ ,'ext': '.md'
          \ ,'custom_wiki2html': 'vimwiki_markdown'
        \ },
        \ {'path': '~/notes/wiki/vimwiki/'
          \ ,'template_path': '~/notes/wiki/'
          \ ,'template_default': 'ztf-template'
          \ ,'template_ext': '.html'
        \ },
        \ {'path': '~/notes/wiki/vimwiki/thesis/'
          \ ,'path_html':'~/notes/wiki/vimwiki_html/thesis/'
          \ ,'template_path': '~/notes/'
          \ ,'template_default': 'thesis-template'
          \ ,'template_ext': '.html'
        \ }
      \ ]

" set up stuff that's configured via lua
lua require('set_up_nvim_lsp')
lua require('set_up_colorizer')

" Statusline function
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

" set up lightline
let g:lightline = {
    \   'colorscheme': 'one',
    \   'active': {
    \     'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'readonly', 'modified', 'filename', 'syn_hl_group']
    \     ],
    \   },
      \ 'component_function': {
      \   'syn_hl_group': 'SyntaxItem',
      \ },
    \ }

" ---------
"   BINDS
" ---------
" leaders
let g:mapleader = "\<space>"
let g:maplocalleader = "\\"

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map = {
      \ 'e' : {  'name' : 'edit...' , 'c' : { 'name' : 'configs...' } } ,
      \ 'g' : {  'name' : 'git...' } ,
      \ 'f' : {  'name' : 'find...' } ,
      \ 'v' : {  'name' : 'views...' } ,
      \ 'n' : {  'name' : 'new...' } ,
      \ 't' : {  'name' : 'terminal...' } ,
      \ 'l' : {  'name' : 'lsp...' } ,
      \ 's' : {  'name' : 'set...' } ,
      \ }

" which-key settings
nnoremap <silent> <leader>      :WhichKey '<space>'<CR>
nnoremap <silent> <localleader> :WhichKey '\'<CR>
set timeoutlen=500 " if you don't use which-key, this makes leader unusable

" terminal mappings and settings
nnoremap <leader>tmc :split <Bar> terminal make clean<CR>
nnoremap <leader>tma :split <Bar> terminal make<CR>
nnoremap <leader>tn  :split <Bar> terminal<CR>
nnoremap <leader>tp  :split <Bar> terminal python3<CR>
"nnoremap <leader>tc  :split <Bar> terminal $(xclip -o -sel clipboard)<CR>
nnoremap <leader>tc  :split <Bar> execute "terminal $(echo " . shellescape(getreg("+")) . ")"<CR>
nnoremap <leader>tt  :split <Bar> terminal $(pwd)/%<CR>
autocmd TermOpen term://* startinsert

autocmd FileType markdown,vimwiki,tex,text,gitcommit set textwidth=80

nnoremap <leader>nt :tabnew<CR>

nnoremap <leader>vm :mkview<CR>
nnoremap <leader>vl :loadview<CR>

" spell mappings
nnoremap <leader>ss :setlocal spell<CR>
nnoremap <leader>s- :setlocal nospell<CR>
nnoremap <leader>sd :setlocal spelllang=de<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>

" editing certain files binds
nnoremap <leader>ecv :edit /home/ztf/repositories/dotfiles/.config/nvim/init.vim<CR>
nnoremap <leader>ecc :edit /home/ztf/repositories/dotfiles/.config/nvim/plugged/vim-colortemplate/templates/mono.colortemplate<CR>
nnoremap <leader>eci :edit /home/ztf/repositories/dotfiles/.config/i3/config<CR>
nnoremap <leader>ecs :edit /home/ztf/repositories/dotfiles/.config/i3status-rust/config.toml<CR>

" vim-fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gS :tab Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gf :Gfetch<CR>
" signify bindings
nnoremap <silent> <leader>gh :SignifyToggle<CR>

" fzf binds
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fF :Files!<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fA :Ag!<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fL :BLines!<CR>
nnoremap <leader>fc :Colors<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fn :cd /home/ztf/notes/wiki/vimwiki <bar> Ag<CR>

" vimwiki mappings
nmap <LocalLeader>wa :VimwikiAll2HTML<CR>
nnoremap <leader>ew :VimwikiIndex<CR>
nnoremap <LocalLeader>wT :VimwikiTOC<CR>

" lsp keymappings (per example, adjusted by me)
nnoremap <leader>ld   <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>lD   <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>lh   <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>li   <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lS   <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>lt   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>lr   <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>lw   <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>lW   <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>lf   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>lR   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ls   <cmd>:echo LspStatus()<CR>
nnoremap <leader>len  <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>lep  <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>lel  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <leader>lo   <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
"nnoremap <leader>lO "[turn on lsp again, somehow]

nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>
