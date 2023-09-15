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
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
-- local c = luasnip.choice_node
local d = luasnip.dynamic_node
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

local random = math.random
local function uuid()
  -- function from <https://gist.github.com/jrus/3197011>
  math.randomseed(os.time())
  local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function(c)
    local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
    return string.format('%x', v)
  end)
end

luasnip.add_snippets("bash", {
  s("definition with efault value", {
    i(1, "varfoo"), t("=${"), i(2, "varbar"), t(":-"), i(3, "defaultval"), t("}"),
  }),
  s("random number (quick and dirty)", {
    t("$(( $RANDOM % "), i(1, "modulus"), t(" + "), i(2, "base-value"), t(" ))"),
  }),
})

luasnip.add_snippets("all", {
  s("uuid", { f(uuid) }),
})

luasnip.add_snippets("go", {
  s("goroutine-inspector", {
    t("	// periodically check the number of goroutines, writing them to "), i(1, "<file/fifo>"), t({"", ""}),
    t("	go func() {"), t({"",""}),
    t("		ticker := time.NewTicker(1 * time.Second)"), t({"",""}),
    t(""), t({"",""}),
    t("		// open "), d(2, function(args) return sn(nil, { t(args[1]) }) end, {1}), t(" for writing"), t({"",""}),
    t("		file, err := os.OpenFile("), d(3, function(args) return sn(nil, { t('"'), t(args[1]), t('"') }) end, {1}), t(", os.O_CREATE|os.O_WRONLY, 0644)"), t({"",""}),
    t("		if err != nil {"), t({"",""}),
    t("			panic(err)"), t({"",""}),
    t("		}"), t({"",""}),
    t(""), t({"",""}),
    t("		for range ticker.C {"), t({"",""}),
    t("			// print number of goroutines"), t({"",""}),
    t("			n := runtime.NumGoroutine()"), t({"",""}),
    t("			fmt.Fprintln(file, n)"), t({"",""}),
    t("			if n > "), i(4, "1000"), t(" {"), t({"",""}),
    t("				// 😨 what a bunch of goroutines 😨"), t({"",""}),
    t("			}"), t({"",""}),
    t("		}"), t({"",""}),
    t("	}()"), t({"",""}),
  })
})

require("luasnip.loaders.from_vscode").lazy_load()
