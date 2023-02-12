local luasnip = require("luasnip")

luasnip.setup({
  region_check_events = 'CursorMoved', -- still doesn't seem to work on same line but good enough...
  delete_check_events = 'InsertLeave',
})

-- imap <expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- vim.keymap.set('i', '<c-l>', function() luasnip.jump( 1) end, {})
-- vim.keymap.set('i', '<c-h>', function() luasnip.jump(-1) end, {})
-- vim.keymap.set('s', '<c-l>', function() luasnip.jump( 1) end, {})
-- vim.keymap.set('s', '<c-h>', function() luasnip.jump(-1) end, {})
--
vim.cmd('inoremap <c-l> <cmd>lua require"luasnip".jump(1)<CR>')
vim.cmd('inoremap <c-h> <cmd>lua require"luasnip".jump(-1)<CR>')
vim.cmd('snoremap <c-l> <cmd>lua require"luasnip".jump(1)<CR>')
vim.cmd('snoremap <c-h> <cmd>lua require"luasnip".jump(-1)<CR>')
vim.cmd('imap <silent><expr> <c-j> luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<c-j>"')
vim.cmd('smap <silent><expr> <c-j> luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<c-j>"')

