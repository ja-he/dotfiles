" leaders
let mapleader = "\<space>"
let maplocalleader = "\\"

nnoremap <leader>d :NvimTreeToggle<CR>

" terminal mappings and settings
nnoremap <leader>ma  :FloatermNew --wintype=split make -j8 <CR>
nnoremap <leader>mc  :FloatermNew --wintype=split make clean<CR>
nnoremap <leader>mpp :!pandoc "%" -f markdown+implicit_figures -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>mph :!pandoc "%" -f markdown+emoji -t html --citeproc -s -o ~/out.html<CR>
nnoremap <leader>tmpp :FloatermNew pandoc "%" -f markdown -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>tn  :FloatermNew<CR>
nnoremap <leader>tce :FloatermNew --autoclose=0 g++ "%" -o %< && "./%<"<CR>
nnoremap <leader>tt  :FloatermNew --autoclose=0 "./%"<CR>
nnoremap <leader>tpf :FloatermNew ipython<CR>
nnoremap <leader>tps :FloatermNew --wintype=normal ipython<CR>
vnoremap <leader>ts  :FloatermSend<CR>
vnoremap <leader>td  y:FloatermNew --autoclose=0 dictdef '<c-r>"'<CR>

tnoremap <F1> <c-\><c-n>:FloatermToggle<CR>
nnoremap <F1>           :FloatermToggle<CR>
nnoremap <F12>          :FloatermNew --wintype=split<CR>

nnoremap <leader>nt :tabnew<CR>

nnoremap <leader>vm :mkview<CR>
nnoremap <leader>vl :loadview<CR>

" spell mappings
nnoremap <leader>ss :setlocal spell<CR>
nnoremap <leader>s- :setlocal nospell<CR>
nnoremap <leader>sd :setlocal spelllang=de<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>

nnoremap <leader>snh :nohlsearch<CR>

nnoremap <leader>sc :call Conceal()<CR>
nnoremap <leader>sC :call NoConceal()<CR>

" editing certain files binds
nnoremap <leader>ecv :edit /home/ztf/repositories/dotfiles/.config/nvim/init.vim<CR>
nnoremap <leader>ecc :edit /home/ztf/repositories/dotfiles/.config/nvim/lua/kurzzug-dev.lua<CR>
nnoremap <leader>eci :edit /home/ztf/repositories/dotfiles/.config/i3/config<CR>
nnoremap <leader>ecs :edit /home/ztf/repositories/dotfiles/.config/i3status-rust/config.toml<CR>
nnoremap <leader>ew  :edit /home/ztf/notes/mdwiki/index.md<CR>

nnoremap <leader>c :lua require'lush'.export_to_buffer(require'kurzzug-dev')<CR>
nnoremap <leader>C :edit /home/ztf/repositories/dotfiles/.config/nvim/colors/kurzzug-dev.vim<CR>

" vim-fugitive bindings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gS :tab Git<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gf :Gfetch<CR>
" other git-binds
nnoremap <leader>gd :FloatermNew --width=0.9 git diff %<CR>
nnoremap <leader>gg :FloatermNew --wintype=split --autoclose=0 git graph<CR>
" signify bindings
nnoremap <silent> <leader>gh :SignifyToggle<CR>

" fzf binds
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fF :Files!<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fA :Ag!<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fL :BLines!<CR>
nnoremap <leader>fc :Colors<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fs :Snippets<CR>
nnoremap <leader>fw :cd /home/ztf/notes/wiki/vimwiki <bar> Ag<CR>
nnoremap <leader>fn :cd /home/ztf/notes/mdwiki <bar> Ag<CR>

" lsp keymappings (per example, adjusted by me)
nnoremap <leader>ld   <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>lD   <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>lh   <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>li   <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lS   <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>lt   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>lr   <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>lw   <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>lW   <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>lf   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>lR   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ls   <cmd>:echo LspStatus()<CR>
nnoremap <leader>len  <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>lep  <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>lel  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
"nnoremap <leader>lo   <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
"nnoremap <leader>lO "[turn on lsp again, somehow]

nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>

vnoremap <leader>x c<C-R>=system("IFS='\n' read input; python -c \"print($input,end='')\"",@+)<CR><ESC>
