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

  " undo across closing/reopening
    set undofile

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
    " complete til longest common string, using wildmenu
    set wildmode=longest:full
    set wildchar=<tab> 
    set wildignorecase
    set wildignore=

  " show current position
    set ruler

  " command bar height
    set cmdheight=1

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

" don't apply conceallevel on cursor line in normal mode
set concealcursor-=n

" let the foldcolumn expand with fold automatically up to 3 levels of nesting
set foldcolumn=auto:3

" __________________________________________________________________

" -------------
"   BEHAVIOUR
" -------------

let g:netrw_browsex_viewer="feh"

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
    Plug 'fcpg/vim-waikiki'
    Plug 'mhinz/vim-signify' " TODO: replace with 'lewis6991/gitsigns.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'rhysd/git-messenger.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'SirVer/ultisnips'
"   Plug 'honza/vim-snippets'
"   Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'chrisbra/unicode.vim'
    Plug 'kylelaker/riscv.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'liuchengxu/vista.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvim-lua/completion-nvim' " TODO(ztf): replace with nvim-compe (below)
"   Plug 'hrsh7th/nvim-compe'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'voldikss/vim-floaterm'
"   Plug 'lervag/vimtex'
    Plug 'metakirby5/codi.vim'
    Plug 'dstein64/nvim-scrollview'
    Plug 'rktjmp/lush.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ja-he/kurzzug'
    Plug 'nvim-lua/plenary.nvim'
"   Plug 'folke/todo-comments.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    call plug#end()

let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_width = 60 "30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [] "empty by default
let g:nvim_tree_gitignore = 0 "0 by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 0 " <TODO (doesn't seem to work?)> "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 " <TODO> " 0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 0 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 1 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 1 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 1 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 0 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 0 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 0 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 1 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' -> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_update_cwd = 0 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_window_picker_exclude = {} " Dictionary of buffer option names mapped to a list of option values that indicates to the window picker that the buffer's window should not be selectable.
let g:nvim_tree_special_files = {} " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ztf-snippets"]

let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#blacklist = ['atx','footnote','subscript','codeblock_start','codeblock_delim']
let g:pandoc#syntax#conceal#cchar_overrides = {}
let g:pandoc#syntax#codeblocks#embeds#use = 0

let g:colortemplate_no_mappings = 1

if empty($DISPLAY)
  colorscheme fahrenheit
else
  set background=light
  "colorscheme kurzzug
lua << EOF
    local lush = require('lush')
    local parsed = require('mono_lush')
    local compiled = lush.compile(parsed, {force_clean = true })
    lush.apply(compiled)
EOF
endif

  " git-messenger settings
    let g:git_messenger_always_into_popup = v:true

  " disable icons (which our font doesnt render right) in vista
    let g:vista#renderer#enable_icon = 0

" ... [ <size> , <contents preview toggle keymapping> ]
let g:fzf_preview_window = [ 'up:75%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }

" -----------
"   VIMWIKI
" -----------

let g:waikiki_roots = ['~/notes/mdwiki']
let maplocalleader = "\<F7>"
let g:waikiki_default_maps = 1

" set up stuff that's configured via lua
lua require('set_up_nvim_lsp')
lua require('set_up_colorizer')

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
EOF

" Statusline function
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

" ---------
"   BINDS
" ---------
" leaders
let g:mapleader = "\<space>"
let g:maplocalleader = "\\"

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_sep = '-'
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
vnoremap <silent> <leader>      :WhichKeyVisual '<space>'<CR>
set timeoutlen=500 " if you don't use which-key, this makes leader unusable

nnoremap <leader>d :NvimTreeToggle<CR>

" terminal mappings and settings
nnoremap <leader>ma  :FloatermNew --wintype=split make -j8 <CR>
nnoremap <leader>mc  :FloatermNew --wintype=split make clean<CR>
nnoremap <leader>mpp :!pandoc "%" -f markdown+implicit_figures -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>mph :!pandoc "%" -f markdown+emoji -t html --citeproc -s -o ~/out.html<CR>
nnoremap <leader>tmpp :FloatermNew pandoc "%" -f markdown -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>tn  :FloatermNew<CR>
nnoremap <leader>tce :FloatermNew --autoclose=0 g++ "%" -o %< && "./%<"<CR>
nnoremap <leader>tt  :FloatermNew --autoclose=0 "./%"<CR>
nnoremap <leader>tpf :FloatermNew ipython<CR>
nnoremap <leader>tps :FloatermNew --wintype=normal ipython<CR>
vnoremap <leader>ts  :FloatermSend<CR>
vnoremap <leader>td  y:FloatermNew --autoclose=0 dictdef '<c-r>"'<CR>
autocmd TermOpen term://* startinsert

tnoremap <F1> <c-\><c-n>:FloatermToggle<CR>
nnoremap <F1>           :FloatermToggle<CR>
nnoremap <F12>          :FloatermNew --wintype=split<CR>

autocmd FileType gitcommit,text       set textwidth=68
"autocmd FileType markdown             set filetype=pandoc
autocmd FileType tex                  set textwidth=80
autocmd FileType floaterm set nonumber norelativenumber
autocmd BufRead,BufNewfile */zettelkasten/2[0-1][0-9][0-9]-[0-1][0-9]-[0-3][0-9]/*
                                          \  set filetype=markdown.pandoc |
                                          \  set spell                    |
                                          \  set spelllang=en,de
autocmd FileType mail
  \  set spell |
  \  set spelllang=en,de

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

function! WaikikiSetup()
  nmap <Tab>    <Plug>(waikikiNextLink)
  nmap <S-Tab>  <Plug>(waikikiPrevLink)
  nmap <CR>     <Plug>(waikikiFollowLink)
  nmap <BS>     <Plug>(waikikiGoUp)
endfunction

autocmd FileType markdown.pandoc call WaikikiSetup()
autocmd FileType markdown.pandoc               set textwidth=80

nnoremap <leader>nt :tabnew<CR>

nnoremap <leader>vm :mkview<CR>
nnoremap <leader>vl :loadview<CR>

" spell mappings
nnoremap <leader>ss :setlocal spell<CR>
nnoremap <leader>s- :setlocal nospell<CR>
nnoremap <leader>sd :setlocal spelllang=de<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>

nnoremap <leader>snh :nohlsearch<CR>

function! Conceal()
  setlocal conceallevel=2
  setlocal concealcursor-=n
endfunction

function! NoConceal()
  setlocal conceallevel=0
endfunction

nnoremap <leader>sc :call Conceal()<CR>
nnoremap <leader>sC :call NoConceal()<CR>

" editing certain files binds
nnoremap <leader>ecv :edit /home/ztf/repositories/dotfiles/.config/nvim/init.vim<CR>
nnoremap <leader>ecc :edit /home/ztf/repositories/dotfiles/.config/nvim/lua/kurzzug-dev.lua<CR>
nnoremap <leader>eci :edit /home/ztf/repositories/dotfiles/.config/i3/config<CR>
nnoremap <leader>ecs :edit /home/ztf/repositories/dotfiles/.config/i3status-rust/config.toml<CR>
nnoremap <leader>ew  :edit /home/ztf/notes/mdwiki/index.md<CR>

nnoremap <leader>c :lua require'lush'.export_to_buffer(require'kurzzug-dev')<CR>
nnoremap <leader>C :edit /home/ztf/repositories/dotfiles/.config/nvim/colors/kurzzug-dev.vim<CR>

let g:floaterm_autoclose = 1
" disable title
let g:floaterm_title = ''
let g:floaterm_width = 0.8
let g:floaterm_height = 0.7
" no visible border
let g:floaterm_borderchars = '        '

" vim-fugitive bindings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gS :tab Git<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gf :Gfetch<CR>
" other git-binds
nnoremap <leader>gd :FloatermNew --width=0.9 git diff %<CR>
nnoremap <leader>gg :FloatermNew --wintype=split --autoclose=0 git graph<CR>
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
nnoremap <leader>fs :Snippets<CR>
nnoremap <leader>fw :cd /home/ztf/notes/wiki/vimwiki <bar> Ag<CR>
nnoremap <leader>fn :cd /home/ztf/notes/mdwiki <bar> Ag<CR>

" vimwiki mappings
"nmap <LocalLeader>wa :VimwikiAll2HTML<CR>
"nnoremap <leader>ew :VimwikiIndex<CR>
"nnoremap <LocalLeader>wT :VimwikiTOC<CR>

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
"nnoremap <leader>lo   <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
"nnoremap <leader>lO "[turn on lsp again, somehow]

nnoremap <leader>h?   <cmd>echo SyntaxItem()<CR>
nnoremap <leader>hh   <cmd>:ColorizerAttachToBuffer<CR>

nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>

vnoremap <leader>x c<C-R>=system("IFS='\n' read input; python -c \"print($input,end='')\"",@+)<CR><ESC>

" highlight yanked section for a brief moment
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='DiffAdd', timeout=200 }
augroup END
