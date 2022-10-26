" open files at last position
" (the mark " is the position last closed at)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd TermOpen term://* startinsert

autocmd FileType gitcommit set textwidth=68
autocmd FileType floaterm set nonumber norelativenumber

autocmd FileType rust                 let termdebugger="rust-gdb"

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" highlight yanked section for a brief moment
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='DiffAdd', timeout=200 }
augroup END

augroup spdx_ft_setting
    au! BufNewFile,BufFilePre,BufRead *.spdx set filetype=spdx
augroup END

augroup cmdwin
  au CmdwinEnter * setlocal nonumber norelativenumber
augroup END
