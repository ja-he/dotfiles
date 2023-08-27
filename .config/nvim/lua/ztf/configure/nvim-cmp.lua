local cmp = require("cmp")
cmp.setup{
  snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c'}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = function(fallback)
       if cmp.visible() then
          cmp.select_next_item()
       elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
       else
          fallback()
       end
    end,
    ["<C-p>"] = function(fallback)
       if cmp.visible() then
          cmp.select_prev_item()
       elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
       else
          fallback()
       end
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  })
}
