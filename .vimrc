" __________________________________________________________________________________________________ 
"
"			                                ___           ___           ___     
"			       ___        ___          /__/\         /  /\         /  /\    
"			      /__/\      /  /\        |  |::\       /  /::\       /  /:/    
"			      \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/     
"			       \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___ 
"			   ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"			  /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"			  \  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/ 
"			   \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/  
"			    \__\::::/      \__\/      \  \:\        \  \:\        \  \::/   
"			        ~~~~                   \__\/         \__\/         \__\/    
"
" __________________________________________________________________________________________________

" ----------------
" GENERAL SETTINGS 
" ----------------

    " Don't make any effort for vi compatibility 
        set nocompatible 

    " sets the lines of history, that vim will remember 
        set history=500

    " enable filetype plugins 
        filetype plugin on
        filetype indent on 

    " set to automatically ready if a file was externally changed 
        set autoread 

    " fixing the capital :W human error 
        command W w !sudo tee % > /dev/null 


" __________________________________________________________________________________________________

" ------------------
" INTERFACE SETTINGS 
" ------------------

    " show line numbers 
        set number 
    " make them grey on black 
        highlight LineNr ctermfg=grey ctermbg=black

    " color column at the 101st column 
    " this is currently done by the command below, 
    " thanks to Damian Conway
        set colorcolumn=101
    " make the column dark grey
        highlight ColorColumn ctermbg=8

    " Damian Conway's clever ColorColumn regex. Highlights the 101st column only in lines in which 
    " the text overflows that limit (which is a few characters beyond the previous line)
        "highlight ColorColumn ctermbg=magenta
        "call matchadd('ColorColumn', '\%101v', 100)

    " indicate the current line by underscoring 
        set cursorline 

    " predictive command menu (visualization) 
        set wildmenu 

    " show current position 
        set ruler 

    " command bar height 
        set cmdheight=2

    " adjusting backspace behaviour 
        set backspace=eol,start,indent
        set whichwrap+=<,>,h,l

    " ignore case in searches 
        set ignorecase 
    " still prioritize though 
        set smartcase 

    " highlight search results 
        set hlsearch 

    " show matching brackets, when on indicator 
        set showmatch 

    " matching bracket blinking speed (10ths of seconds) 
        set mat=2 

    " always show the status line 
        set laststatus=2

    " format status line (commented out, since it didnt work, i made 0 effort to
    " fix it though...)
        "set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

    " make cursor shape dependent on insert vs normal mode 
        if has("autocmd")
              au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
                au InsertEnter,InsertChange *
                    \ if v:insertmode == 'i' |
                    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
                    \ elseif v:insertmode == 'r' |
                    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
                    \ endif
                  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
              endif

    " enable the mouse for text navigation 
        set mouse=a 


" __________________________________________________________________________________________________

" -----------
" BEAUTIFYING 
" ----------- 

    " syntax highlighting 
        syntax enable 

    " auto indent 
        set ai 

    " smart indent 
        set si 

    " wrap lines 
        set wrap 


" __________________________________________________________________________________________________

" ----------
" FILES ETC.
" ----------

    " turn off backup, since it's annoying 
        set nobackup
        set nowb
        set noswapfile 

" __________________________________________________________________________________________________

" --------------
" TEXT BEHAVIOUR 
" --------------

    " tabs become spaces 
        set expandtab 

    " smart tabs 
        set smarttab 

    " 1 Tab = 4 Spaces 
        set shiftwidth=4    " inserting tabs = 4 spaces 
        set tabstop=4       " existing tabs = 4 spaces 
        set expandtab
        set softtabstop=4   " delete the 4 spaces of a tab with backspace 

    " UTF-8 standard encoding 
        set encoding=utf8

    " delete trailing whitespaces on saving 
        fun! CleanExtraSpaces()
            let save_cursor = getpos(".")
            let old_query = getreg('/')
                silent! %s/\s\+$//e
                call setpos('.', save_cursor)
                call setreg('/', old_query)
        endfun

        if has("autocmd")
            autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
        endif


" __________________________________________________________________________________________________

" -------
" PLUGINS 
" -------

    " Pathogen 
        execute pathogen#infect()


" __________________________________________________________________________________________________

" -----
" BINDS
" -----

    " paste toggle so (vim stops messing with pasted text formatting)
        set pastetoggle=<F2>

    " LaTeX-Box binds 
        command LV      LatexView
        command Lmk     Latexmk

    " 
