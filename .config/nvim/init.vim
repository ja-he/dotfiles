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

  " use 24-bit RGB colors
    set termguicolors

  " show line numbers (relative w/ current line showing actual
  " number)
    set number
    set relativenumber

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

  " set the colorscheme to my preferred colorscheme
     colo blackbox

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

  " set a max textwidth of 68 characters
    set tw=80

  " enable the mouse in diff mode
    if &diff
      set mouse=a
      set colorcolumn=0
    endif

  " assume latex files are 'latex' not 'plaintex'
    let g:tex_flavor = "latex"

" __________________________________________________________________

" ---------
"   BINDS
" ---------

  " more accessible move-to-mark key
    map ß `

  " 
    let g:mapleader = "\<space>"

  " terminal mappings and settings
    nnoremap <leader>tmc :split <Bar> terminal make clean<CR>
    nnoremap <leader>tma :split <Bar> terminal make<CR>
    autocmd TermOpen term://* startinsert

  " spell mappings
    nnoremap <leader>ss :set spell<CR>
    nnoremap <leader>s- :set nospell<CR>
    nnoremap <leader>sd :set spelllang=de<CR>
    nnoremap <leader>se :set spelllang=en<CR>
    nnoremap <leader>se :set spelllang=en<CR>

" ---------
"   PLUG
" ---------

    call plug#begin()
    Plug 'vimwiki/vimwiki'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
"   Plug 'vim-pandoc/vim-pandoc'
"   Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'rhysd/vim-clang-format'
    Plug 'rhysd/git-messenger.vim'
    Plug 'chrisbra/unicode.vim'
    Plug 'kylelaker/riscv.vim'
    Plug 'aklt/plantuml-syntax'
    Plug 'liuchengxu/vim-which-key'
    Plug 'liuchengxu/vista.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    if has('nvim-0.5')
      " add the lsp plugins for nvim 0.5
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/diagnostic-nvim'
        Plug 'nvim-lua/completion-nvim'
        Plug 'nvim-lua/lsp-status.nvim'
    else
      " plug coc
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'clangd/coc-clangd'
    endif
    call plug#end()

  " which-key settings
    nnoremap <leader> :WhichKey '<space>'<CR>
    set timeoutlen=10 " if you don't use which-key, this makes leader unusable

    lua require'colorizer'.setup()

  " git-messenger settings
    let g:git_messenger_always_into_popup = v:true

  " vim-fugitive bindings
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gc :Gcommit<CR>

  " disable icons (which our font doesnt render right) in vista
    let g:vista#renderer#enable_icon = 0

"   let g:fzf_layout = {
"       \ 'window': {
"       \     'width': 0.95,
"       \     'height': 0.6,
"       \     'xoffset': 0.5,
"       \     'yoffset': 0.5,
"       \     'highlight': 'Comment',
"       \     'border': 'sharp',
"       \ }}

  " fzf binds
    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fc :Colors<CR>
    nnoremap <leader>fh :Helptags<CR>

" -----------
"   VIMWIKI
" -----------

    let g:vimwiki_list =
      \ [ {'path': '~/notes/wiki/vimwiki/'
        \ ,'template_path': '~/notes/wiki/'
        \ ,'template_default': 'ztf-template'
        \ ,'template_ext': '.html'
        \ }
      \ , {'path': '~/notes/wiki/vimwiki/thesis/'
        \ ,'path_html':'~/notes/wiki/vimwiki_html/thesis/'
        \ ,'template_path': '~/notes/'
        \ ,'template_default': 'thesis-template'
        \ ,'template_ext': '.html'
        \ }
      \ , {'path': '~/mdtest/'
        \ ,'syntax': 'markdown'
        \ ,'ext': '.md'
        \ ,'custom_wiki2html': 'vimwiki_markdown'
        \ }
      \ ]

  " map \wa to compile the whole wiki
    nmap <Leader>wa :VimwikiAll2HTML<CR>

" neovim 0.5 specific (LSP) stuff
if has('nvim-0.5')
  " set up lsp
lua << EOF
    local nvim_lsp = require('nvim_lsp')

    local lsp_diagnostic = require('diagnostic')

    local lsp_completion = require('completion')

    local lsp_status = require('lsp-status')
    lsp_status.register_progress()
    lsp_status.config{
      status_symbol = "LSP:";
      indicator_errors = "E:";
      indicator_warnings = "W:";
      indicator_info = "I:";
      indicator_hint = "H:";
      indicator_ok = "OK";
    }

    function attach_stuff (client)
      lsp_status.on_attach(client)
      lsp_diagnostic.on_attach(client)
      lsp_completion.on_attach(client)
    end

    nvim_lsp.bashls.setup{on_attach = attach_stuff}

    nvim_lsp.jedi_language_server.setup{on_attach = attach_stuff}

    nvim_lsp.clangd.setup{
      on_attach = attach_stuff,
      callbacks = lsp_status.extensions.clangd.setup(),
      init_options = { clangdFileStatus = true },
      capabilities = lsp_status.capabilities,
      settings = {
        cmd = { "clangd", "--background-index", "-j=5", "--clang-tidy" }
      }
    }

    nvim_lsp.vimls.setup{on_attach = attach_stuff}

EOF

  " Statusline function
    function! LspStatus() abort
      if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
      endif
      return ''
    endfunction
  " set up lightline (with lsp status)
    let g:lightline = {
        \   'colorscheme': 'simpleblack',
        \   'active': {
        \     'left': [
        \       [ 'mode', 'paste' ],
        \       [ 'readonly', 'modified', 'filename' ]
        \     ],
        \   },
        \ }
  " keymappings (per example, adjusted by me)
    nnoremap <silent> gD        <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> <c-space> <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> <c-K>     <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gw        <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
  " set ctrl+space as completion trigger
    imap <silent> <c-space> <Plug>(completion_trigger)
  " map ctrl+n/p to jump through diagnostics
    nnoremap <silent> <c-n> <cmd>NextDiagnosticCycle<CR>
    nnoremap <silent> <c-p> <cmd>PrevDiagnosticCycle<CR>
  " Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
  " Avoid showing message extra message when using completion
    set shortmess+=c
  " avoid automatic completion popup
    let g:completion_enable_auto_popup = 1
    let g:completion_enable_auto_hover = 1
    let g:completion_enable_auto_signature = 1
  " disable inline diagnostic text
    let g:diagnostic_enable_virtual_text = 0
else
  " let vista default to coc
    let g:vista_default_executive = 'coc'

  " map ctrl+space to show doc using coc
    nnoremap <silent> <c-space> :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if &filetype == 'vim'
        execute 'h '.expand('<cword>')
      else
        call CocActionAsync('doHover')
      endif
    endfunction

  " set up lightline (with coc status)
    let g:lightline = {
          \ 'colorscheme': 'simpleblack',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'readonly', 'filename', 'modified', 'cocstatus' ] ]
          \ },
          \ 'component_function': {
          \   'cocstatus': 'coc#status',
          \ },
          \ }

  " coc switch source and header
  " coc autocompletion trigger
    inoremap <silent><expr> <c-space> coc#refresh()

endif

nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>
