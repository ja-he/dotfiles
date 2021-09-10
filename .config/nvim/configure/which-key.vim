call which_key#register('<Space>', "g:which_key_map")

let g:which_key_sep = '-'
let g:which_key_map = {
      \ 'e' : {  'name' : 'edit...' , 'c' : { 'name' : 'configs...' } } ,
      \ 'g' : {  'name' : 'git...' } ,
      \ 'f' : {  'name' : 'find...' } ,
      \ 'v' : {  'name' : 'views...' } ,
      \ 'n' : {  'name' : 'new...' } ,
      \ 't' : {  'name' : 'terminal...' } ,
      \ 'l' : {  'name' : 'lsp...' } ,
      \ 's' : {  'name' : 'set...' } ,
      \ }

" which-key settings
nnoremap <silent> <leader>      :WhichKey '<space>'<CR>
nnoremap <silent> <localleader> :WhichKey '\'<CR>
vnoremap <silent> <leader>      :WhichKeyVisual '<space>'<CR>
set timeoutlen=500 " if you don't use which-key, this makes leader unusable
