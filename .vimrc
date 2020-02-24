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

  " Don't make any effort for vi compatibility 
  set nocompatible 

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
  "   | Note: This doesn't necessarily work on every Vim install
  "   | check whether it works using
  "   |  > :echo has('clipboard') 
  "   | or by searching for '+clipboard' in the output of 
  "   |  > $ vim --version 
    set clipboard=unnamedplus
    "set clipboard=unnamed

  " eliminate the delay exiting insert mode 
    set timeoutlen=0

" __________________________________________________________________

" ----------------------
"   INTERFACE SETTINGS  
" ----------------------

  " 256 colors 
    set t_Co=256

  " show line numbers (relative w/ current line showing actual
  " number)
    set number
    set norelativenumber 

  " color columns at the 69th and 81st column thanks to Damian
  " Conway
    set colorcolumn=69,81

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

  " highlight search results 
    set hlsearch 

  " show matching brackets, when on indicator 
    set showmatch 

  " always show the status line 
    set laststatus=2

  " make cursor shape dependent on insert vs normal mode 
    if has("autocmd")
      au VimEnter,InsertLeave 
        \ * silent execute '!echo -ne "\e[2 q"' | redraw!
      au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
      au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    endif

" __________________________________________________________________

" --------------
"   APPEARANCE  
" -------------- 

  " syntax highlighting 
    syntax on 

  " auto indent 
    set ai 

  " smart indent 
    set si 

  " wrap lines 
    set wrap 

  " let linewrap respect indentation 
    set breakindent

" __________________________________________________________________

" ---------
"   FILES  
" ---------

  " turn off backup, since it's annoying 
    set nobackup
    set nowb
    set noswapfile 

" __________________________________________________________________

" -------------
"   BEHAVIOUR  
" -------------

  " tabs become spaces 
    set expandtab 

  " smart tabs 
    set smarttab 

  " 1 tab = 2 spaces as the standard setting 
    set shiftwidth=2  " inserting tabs = 2 spaces 
    set tabstop=2     " existing tabs = 2 spaces 
    set softtabstop=2 " delete the 2 spaces of a tab with backspace 

  " UTF-8 standard encoding 
    set encoding=utf8

  " set a max textwidth of 68 characters
    set tw=68

" __________________________________________________________________

" ---------
"   BINDS  
" ---------
    
  " more accessible move-to-mark key 
    map ß `

  " paste toggle so (vim stops messing with pasted text formatting)
    set pastetoggle=<F2>

  " basic make bind
    map <F3> :!make<CR>

  " ctrl+hjkl navigation between splits 
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_

  " get to first non-empty char of line via H instead of ^
    nnoremap H ^

" __________________________________________________________________

" --------
"   MISC
" --------

  " Show highlighting groups for current word 
    nmap <C-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack() 
      if !exists("*synstack")
        return
      endif 
      echo map(synstack(line('.'), 
              \col('.')), 'synIDattr(v:val, "name")')
    endfunc

" __________________________________________________________________

" -----------
"   PLUGINS  
" -----------

  " pathogen 
    " use this to disable plugins if you need to find a bottleneck:
    "  > let g:pathogen_disabled = ["vim-airline"]
    execute pathogen#infect()

  " arm-assembly highlighting
    au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

  " colorscheme (from GitHub through pathogen)
    colo fahrenheit

  " powerline
    set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim/
