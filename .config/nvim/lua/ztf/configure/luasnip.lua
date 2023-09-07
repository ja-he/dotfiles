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

local s = luasnip.snippet
-- local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
-- local f = luasnip.function_node
-- local c = luasnip.choice_node
-- local d = luasnip.dynamic_node
-- local r = luasnip.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")

luasnip.add_snippets("bash", {
  s("definition with efault value", {
    i(1, "varfoo"), t("=${"), i(2, "varbar"), t(":-"), i(3, "defaultval"), t("}"),
  }),
  s("random number (quick and dirty)", {
    t("$(( $RANDOM % "), i(1, "modulus"), t(" + "), i(2, "base-value"), t(" ))"),
  }),
})

require("luasnip.loaders.from_vscode").lazy_load()
