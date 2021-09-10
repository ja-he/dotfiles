
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

set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noselect

