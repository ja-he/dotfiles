map j gj
map k gk

" '=' -> fold toggle
map = za

" leaders
let mapleader = "\<space>"
let maplocalleader = "\\"

nnoremap <leader>d :NvimTreeToggle<CR>

" terminal mappings and settings
nnoremap <leader>ma  :FloatermNew --autoclose=0 --wintype=split make -j8 <CR>
nnoremap <leader>mc  :FloatermNew --wintype=split make clean<CR>
nnoremap <leader>mpp :!pandoc "%" -f markdown+implicit_figures -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>mph :!pandoc "%" -f markdown+emoji -t html --citeproc --mathjax -s -o ~/out.html<CR>
nnoremap <silent> <leader>mr  :CellularAutomaton make_it_rain<CR>
nnoremap <leader>tmpp :FloatermNew pandoc "%" -f markdown -t pdf --citeproc -s -o ~/out.pdf<CR>
nnoremap <leader>mv  :MarkdownPreview<CR>
nnoremap <leader>tn  :FloatermNew<CR>
nnoremap <leader>tce :FloatermNew --autoclose=0 g++ "%" -o %< && "./%<"<CR>
nnoremap <leader>tt  :FloatermNew --autoclose=0 "./%"<CR>
nnoremap <leader>tpf :FloatermNew ipython<CR>
nnoremap <leader>tps :FloatermNew --wintype=normal ipython<CR>
vnoremap <leader>ts  :FloatermSend<CR>
vnoremap <leader>td  y:FloatermNew --autoclose=0 dictdef '<c-r>"'<CR>

tnoremap <F1>  <c-\><c-n>:FloatermToggle<CR>
nnoremap <F1>            :FloatermToggle<CR>
tnoremap <F2>  <c-\><c-n>:FloatermHide<CR>
nnoremap <F2>            :FloatermNext<CR>
nnoremap <F12>           :FloatermNew --wintype=split<CR>

nnoremap <leader>nt :tabnew<CR>

" focus
vnoremap <leader>xn :TZNarrow<CR>
nnoremap <leader>xn :TZNarrow<CR>
nnoremap <leader>xf :TZFocus<CR>
nnoremap <leader>xm :TZMinimalist<CR>
nnoremap <leader>xa :TZAtaraxis<CR>

nnoremap <leader>vm :mkview<CR>
nnoremap <leader>vl :loadview<CR>

" check test coverage
nnoremap <leader>ctc :lua require'nvim-goc'.Coverage()<CR>
" check test CLEAR coverage
nnoremap <leader>ctC :lua require'nvim-goc'.ClearCoverage()<CR>
" check lint
nnoremap <leader>cl  :FloatermNew --wintype=split --autoclose=0 revive -formatter stylish %<CR>

" spell mappings
nnoremap <leader>ss :setlocal spell<CR>
nnoremap <leader>s- :setlocal nospell<CR>
nnoremap <leader>sd :setlocal spelllang=de<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>
nnoremap <leader>se :setlocal spelllang=en<CR>
nnoremap <leader>sf :lua require'telescope.builtin'.spell_suggest()<CR>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s

nnoremap <leader>snh :nohlsearch<CR>

nnoremap <leader>sc :call Conceal()<CR>
nnoremap <leader>sC :call NoConceal()<CR>

" editing certain files binds
nnoremap <leader>ecv :edit $HOME/repositories/dotfiles/.config/nvim/init.vim<CR>
nnoremap <leader>ecc :edit $HOME/repositories/dotfiles/.config/nvim/lua/kurzzug-dev.lua<CR>
nnoremap <leader>eci :edit $HOME/repositories/dotfiles/.config/i3/config<CR>
nnoremap <leader>ecs :edit $HOME/repositories/dotfiles/.config/i3status-rust/config.toml<CR>
nnoremap <leader>ew  :edit $HOME/notes/mdwiki/index.md<CR>

" nnoremap <leader>c :lua require'lush'.export_to_buffer(require'kurzzug-dev')<CR>
" nnoremap <leader>C :edit $HOME/repositories/dotfiles/.config/nvim/colors/kurzzug-dev.vim<CR>

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

" find binds (telescope and fzf)
nnoremap <silent> <leader>ff :lua require'telescope.builtin'.find_files({hidden = true})<CR>
nnoremap          <leader>fF :Files<CR>
nnoremap <silent> <leader>fc :lua require'telescope.builtin'.find_files({cwd = "$HOME/.config/"})<cr>
nnoremap <silent> <leader>fa :lua require'telescope.builtin'.live_grep()<cr>
nnoremap          <leader>fA :Ag<CR>
nnoremap <silent> <leader>fgc :lua require'telescope.builtin'.git_commits()<cr>
nnoremap <silent> <leader>fgb :lua require'telescope.builtin'.git_branches()<cr>
nnoremap <silent> <leader>fgs :lua require'telescope.builtin'.git_stash()<cr>
nnoremap <silent> <leader>fbs :lua require'telescope.builtin'.lsp_document_symbols()<cr>
nnoremap <silent> <leader>fbl :lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>
nnoremap          <leader>fbL :BLines<CR>
nnoremap <silent> <leader>fh :lua require'telescope.builtin'.help_tags()<CR>
nnoremap          <leader>fs :Snippets<CR>
nnoremap <silent> <leader>ftb :lua require'telescope.builtin'.builtin({previewer=false})<cr>
" z binds
"nnoremap <silent> <leader>zff :lua require'telescope.builtin'.find_files({cwd = "$ZETTELKASTENPATH", find_command = {'rg', '--files', '--glob', '!README.md'}})<cr>
"nnoremap          <leader>zfa :cd $ZETTELKASTENPATH<CR>:Ag<CR>
"nnoremap          <leader>ze :tabe $ZETTELKASTENPATH/
nnoremap          <leader>zff :lua require'z'.z_file_picker()<CR>
nnoremap          <leader>zs :FloatermNew --wintype=split z sync<CR>
nnoremap          <leader>zm :FloatermNew --wintype=split z make<CR>

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
nnoremap <leader>lf   <cmd>lua vim.lsp.buf.format()<CR>
nnoremap <leader>lR   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ls   :LspInfo<CR>
nnoremap <leader>len  <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>lep  <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>lel  <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <leader>leL  <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <leader>lea  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lo   :LspStop<CR>
nnoremap <leader>lO   :LspStart<CR>
autocmd FileType rust nnoremap <leader>lt :RustToggleInlayHints<CR>

nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
nnoremap <c-h> :-tabmove<CR>
nnoremap <c-l> :+tabmove<CR>

vnoremap <leader>X c<C-R>=system("IFS='\n' read input; python -c \"print($input,end='')\"",@+)<CR><ESC>

nnoremap <leader>T :TSBufToggle highlight<CR>

" --- copilot ---
" Dismiss the current suggestion.
inoremap <c-c>d <Plug>(copilot-dismiss)
" Cycle to the next suggestion, if one is available.
inoremap <c-c>n <Plug>(copilot-next)
" Cycle to the previous suggestion.
inoremap <c-c>p <Plug>(copilot-previous)
" Explicitly request a suggestion, even if Copilot is disabled.
inoremap <c-c>S <Plug>(copilot-suggest)
