" ... [ <size> , <contents preview toggle keymapping> ]
let g:fzf_preview_window = [ 'up:75%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 , 'border': 'none' } }

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" CTRL-A CTRL-Q to select all and build quickfix list
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_colors = {
      \ 'fg':         [ 'fg', 'TelescopeNormal' ],
      \ 'bg':         [ 'bg', 'TelescopeNormal' ],
      \ 'fg+':        [ 'fg', 'TelescopeSelection' ],
      \ 'bg+':        [ 'bg', 'TelescopeSelection' ],
      \ 'preview-fg': [ 'fg', 'TelescopePreviewNormal' ],
      \ 'preview-bg': [ 'bg', 'TelescopePreviewNormal' ],
      \ 'border':     [ 'bg', 'TelescopePreviewNormal' ],
      \ 'hl':         [ 'fg', 'Conceal' ],
      \ 'hl+':        [ 'fg', 'Conceal' ],
      \ 'gutter':     [ 'bg', 'TelescopeNormal' ],
      \ 'query':      [ 'fg', 'TelescopeNormal' ],
      \ 'disabled':   [ 'bg', 'TelescopeNormal' ],
      \ 'prompt':     [ 'fg', 'TelescopeTitle' ],
      \ 'pointer':    [ 'fg', 'TelescopeTitle' ],
      \ 'info':       [ 'fg', 'TelescopeTitle' ],
      \ 'spinner':    [ 'fg', 'TelescopeTitle' ],
      \ 'header':     [ 'fg', 'TelescopeTitle' ],
      \ }
