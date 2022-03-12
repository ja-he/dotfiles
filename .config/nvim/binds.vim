" leaders
let mapleader = "\<space>"
let maplocalleader = "\\"

nnoremap <leader>d :NvimTreeToggle<CR>

" terminal mappings and settings
nnoremap <leader>ma  :FloatermNew --autoclose=0 --wintype=split make -j8 <CR>
nnoremap <leader>mc  :FloatermNew --wintype=split make clean<CR>
nnoremap <leader>mpp :!pandoc "%" -f markdown+implicit_figures -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>mph :!pandoc "%" -f markdown+emoji -t html --citeproc -s -o ~/out.html<CR>
nnoremap <leader>tmpp :FloatermNew pandoc "%" -f markdown -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>mv  :MarkdownPreview<CR>
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
nnoremap <leader>ecv :edit $HOME/repositories/dotfiles/.config/nvim/init.vim<CR>
nnoremap <leader>ecc :edit $HOME/repositories/dotfiles/.config/nvim/lua/kurzzug-dev.lua<CR>
nnoremap <leader>eci :edit $HOME/repositories/dotfiles/.config/i3/config<CR>
nnoremap <leader>ecs :edit $HOME/repositories/dotfiles/.config/i3status-rust/config.toml<CR>
nnoremap <leader>ew  :edit $HOME/notes/mdwiki/index.md<CR>

nnoremap <leader>c :lua require'lush'.export_to_buffer(require'kurzzug-dev')<CR>
nnoremap <leader>C :edit $HOME/repositories/dotfiles/.config/nvim/colors/kurzzug-dev.vim<CR>

" zettelkasten
nnoremap <silent> <leader>zff :lua require'telescope.builtin'.find_files({cwd = "$ZETTELKASTENPATH", find_command = {'rg', '--files', '--glob', '!README.md'}})<cr>
nnoremap <leader>zfa :cd $ZETTELKASTENPATH<CR>:Ag<CR>
nnoremap <leader>ze :tabe $ZETTELKASTENPATH/
nnoremap <leader>zu :FloatermNew --wintype=split zet update<CR>

" vim-fugitive bindings
nnoremap <leader>gs :tab Git<CR>
nnoremap <leader>gS :Neogit kind=tab<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <leader>gf :Gfetch<CR>
" other git-binds
nnoremap <leader>gd :FloatermNew --width=0.9 git diff %<CR>
nnoremap <leader>gg :FloatermNew --wintype=split --autoclose=0 git graph<CR>
" signify bindings
nnoremap <leader>gh :Gitsigns toggle_numhl<CR>
nnoremap <leader>gH :Gitsigns toggle_word_diff<CR>

" fzf binds
nnoremap <silent> <leader>ff :lua require'telescope.builtin'.find_files()<CR>
nnoremap <leader>fF :Files!<CR>
nnoremap <silent> <leader>fc :lua require'telescope.builtin'.find_files({cwd = "$HOME/.config/"})<cr>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fA :Ag!<CR>
nnoremap <leader>fg :GitFiles<CR>
nnoremap <leader>fG :GitFiles!<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fL :BLines!<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fs :Snippets<CR>
nnoremap <leader>fw :cd $HOME/notes/wiki/vimwiki <bar> Ag<CR>
nnoremap <leader>fn :cd $HOME/notes/mdwiki <bar> Ag<CR>

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
nnoremap <leader>ls   :LspInfo<CR>
nnoremap <leader>len  <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>lep  <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>lel  <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <leader>lea  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lo   :LspStop<CR>
nnoremap <leader>lO   :LspStart<CR>
autocmd FileType rust nnoremap <leader>lt :RustToggleInlayHints<CR>

nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
nnoremap <c-h> :-tabmove<CR>
nnoremap <c-l> :+tabmove<CR>

vnoremap <leader>x c<C-R>=system("IFS='\n' read input; python -c \"print($input,end='')\"",@+)<CR><ESC>

" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <c-l> <cmd>lua require'luasnip'.jump(1)<CR>
inoremap <c-h> <cmd>lua require'luasnip'.jump(-1)<CR>
snoremap <c-l> <cmd>lua require'luasnip'.jump(1)<CR>
snoremap <c-h> <cmd>lua require'luasnip'.jump(-1)<CR>
imap <silent><expr> <c-j> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-j>'
smap <silent><expr> <c-j> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-j>'
