local luasnip = require("luasnip")

luasnip.snippets = {
  -- When trying to expand a snippet, luasnip first searches the tables for
  -- each filetype specified in 'filetype' followed by 'all'.
  -- If ie. the filetype is 'lua.c'
  --     - luasnip.lua
  --     - luasnip.c
  --     - luasnip.all
  -- are searched in that order.
  all = {
  },
  go = {
    luasnip.snippet("fn", {
      luasnip.text_node("func"),
      luasnip.text_node(" "),
      luasnip.insert_node(1, "foo"),
      luasnip.text_node("("),
      luasnip.insert_node(2),
      luasnip.text_node(")"),
      luasnip.text_node(" "),
      luasnip.choice_node(3, {
        luasnip.text_node(""),
        luasnip.snippet_node(nil, {
          luasnip.insert_node(1, "bool"),
          luasnip.text_node(" "),
        }),
      }),
      luasnip.text_node({"{","\t"}),
      luasnip.insert_node(4),
      luasnip.text_node({"","}"}),
    }),
  },
}
