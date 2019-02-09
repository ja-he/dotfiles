" ______________________________________________________________________________
"
"                                      ___           ___           ___     
"             ___        ___          /__/\         /  /\         /  /\    
"            /__/\      /  /\        |  |::\       /  /::\       /  /:/    
"            \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/     
"             \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___ 
"         ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"        /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"        \  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/ 
"         \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/  
"          \__\::::/      \__\/      \  \:\        \  \:\        \  \::/   
"              ~~~~                   \__\/         \__\/         \__\/    
"
" ______________________________________________________________________________

"                   CONTENTS: 
"                       - general settings
"                       - plugins 
"                       - interface settings 
"                       - beautifying 
"                       - files etc. 
"                       - text behaviour 
"                       - binds 

" ______________________________________________________________________________
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

    " set to automatically read if a file was externally changed 
        set autoread 

    " fixing the capital :W human error 
        command W w  

    " global clipboard 
        set clipboard=unnamed

" ______________________________________________________________________________

" -------
" PLUGINS 
" -------

    " Pathogen 
        " use this to disable plugins if you need to find a bottleneck 
        let g:pathogen_disabled = ["vim-airline"]
        execute pathogen#infect()

        " vim-indent-guides color settings 
            let g:indent_guides_auto_colors = 0
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  
                        \ guibg=red   ctermbg=darkgrey
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven 
                        \ guibg=green ctermbg=grey

        " Calendar settings 
        " google calendar 
            let g:calendar_google_calendar = 1 
            let g:calendar_google_task = 1 


" ______________________________________________________________________________

" ------------------
" INTERFACE SETTINGS 
" ------------------

    " 256 colors 
        set t_Co=256

    " show line numbers (relative w/ current line showing actual number)
        set number
        set relativenumber 
    " make them grey on black 
        highlight LineNr ctermfg=darkgrey ctermbg=black

    " color column at the 81st column 
    " this is currently done by the command below, 
    " thanks to Damian Conway
        set colorcolumn=81
    " make the column dark grey
        highlight ColorColumn ctermbg=darkgrey

    " Damian Conway's clever ColorColumn regex. Highlights the 101st column
    " only in lines in which the text overflows that limit (which is a few
    " characters beyond the previous line)
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

    " format status line (commented out, since it didnt work, i made 0 effort
    " to fix it though...) 
    " I currently use vim-airline which makes this obsolete anways. 
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
        set mouse=v 

    " colorscheme (from github through pathogen)
        colo fahrenheit

" ______________________________________________________________________________

" -----------
" BEAUTIFYING 
" ----------- 

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

" ______________________________________________________________________________

" ----------
" FILES ETC.
" ----------

    " turn off backup, since it's annoying 
        set nobackup
        set nowb
        set noswapfile 

" ______________________________________________________________________________

" --------------
" TEXT BEHAVIOUR 
" --------------

    " tabs become spaces 
        set expandtab 

    " smart tabs 
        set smarttab 

    " 1 Tab = 4 Spaces as the standard setting 
        set shiftwidth=4    " inserting tabs = 4 spaces 
        set tabstop=4       " existing tabs = 4 spaces 
        set expandtab
        set softtabstop=4   " delete the 4 spaces of a tab with backspace 

    " filetype-specific settings to only 2 spaces per tab 
        autocmd BufRead,BufNewFile *.cc,*.hh,*.cpp,*.tex,*.md,*.txt,*.hs,*.lhs
                    \ setlocal  tabstop=2
                    \           shiftwidth=2
                    \           softtabstop=2

    
    " UTF-8 standard encoding 
        set encoding=utf8


" ______________________________________________________________________________

" -----
" BINDS
" -----
    
    " more accessible move-to-mark key 
        map ß `

    " paste toggle so (vim stops messing with pasted text formatting)
        set pastetoggle=<F2>

    " LaTeX-Box binds 
        command LV      LatexView
        command Lmk     Latexmk

    " First iteration of LaTeX commands, very basic... 
    " These won't work in insert mode (yet) 
        map <F3> :Latexmk<CR>
        map <F4> :LatexView<CR>

    " Syntax color binds (TODO: make a toggle properly)
        map <F5> :syntax on<CR>
        map <F6> :syntax off<CR>

    " table binds 
        command! -bar Usrtableeval :TableEvalFormulaLine
        command! -bar Usrtableenable :TableModeEnable 
        command! -bar Usrtablecompound Usrtableeval|Usrtableenable 
        map <F7> :Usrtablecompound<CR>

    " let <F5> be the toc-toggler for latex files, 
    " in latex and md files let vim enforce 80 character limit 
        autocmd BufRead,BufNewFile *.tex
                    \ map <F5> :LatexTOCToggle<CR>
        autocmd BufRead,BufNewFile *.tex,*.md,*.txt
                    \ setlocal tw=80
        autocmd BufRead,BufNewFile *.md 
                    \ map <F3> :! pandocify % <CR> 

    " ctrl+hjkl navigation between splits 
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_

