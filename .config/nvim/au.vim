" open files at last position
" (the mark " is the position last closed at)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd TermOpen term://* startinsert

autocmd FileType gitcommit,text       set textwidth=68
"autocmd FileType markdown             set filetype=pandoc
autocmd FileType tex                  set textwidth=80
autocmd FileType floaterm set nonumber norelativenumber
autocmd BufRead,BufNewfile */zettelkasten/2[0-1][0-9][0-9]-[0-1][0-9]-[0-3][0-9]/*
                                          \  set filetype=markdown.pandoc |
                                          \  set spell                    |
                                          \  set spelllang=en,de
autocmd FileType mail,tex
  \  setlocal spell |
  \  setlocal spelllang=en,de

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

autocmd FileType markdown.pandoc               set textwidth=80

" highlight yanked section for a brief moment
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='DiffAdd', timeout=200 }
augroup END
