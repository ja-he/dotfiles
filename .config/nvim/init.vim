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

" __________________________________________________________________

" ---------
"   BINDS
" ---------

  " more accessible move-to-mark key
    map ß `

" ---------
"   PLUG
" ---------

    call plug#begin()
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
"   Plug 'vim-pandoc/vim-pandoc'
"   Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'rhysd/vim-clang-format'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'clangd/coc-clangd'
    Plug 'rhysd/git-messenger.vim'
"   Plug 'vim-airline/vim-airline'
    call plug#end()

  " check the commit
    nmap <Space> :GitMessenger<CR>

  " coc switch source and header
    nmap <Tab> :CocCommand clangd.switchSourceHeader<CR>

  " coc autocompletion trigger
    inoremap <silent><expr> <c-space> coc#refresh()

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
