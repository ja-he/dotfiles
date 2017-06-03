filetype plugin on

" Custom commands to make LaTeX compiling and viewing more easily accessible 
command LV      LatexView
command Lmk     Latexmk

"syntax enable
colors distinguished

highlight LineNr ctermfg=grey ctermbg=black

" Enables line numbers 
set number

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" allows to delete the four spaces in a tab with one backspace 
set softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Smart indented line breaking 
" particularly for .tex group projects this works well
" where others might edit the same doc on TeXworks 
set breakindent

" Makes cursor shape dependent on insert vs normal mode
" []  block for -- normal --  
" |   line  for -- insert --
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

" Enables mouse support 
set mouse=a

" shows the most recent command in the bottom left 
set showcmd

" highlighting current line of cursor
set cursorline 

" predictive command menu 
set wildmenu

" indicates the match to any bracket / parenthesis / ... 
set showmatch 

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
