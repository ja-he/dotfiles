local lspconfig = require("lspconfig")

-- You can specify the capabilities to exclude snippets explicitly like this
-- but in my experience it is not necessary:
--
--    local capabilities = require("cmp_nvim_lsp").update_capabilities(
--      vim.lsp.protocol.make_client_capabilities()
--    )
--    capabilities.textDocument.completion.snippetSupport = false

lspconfig.gopls.setup{}

lspconfig.vimls.setup{}

-- local luadev = require("lua-dev").setup{
--   lspconfig = {
--     cmd = {"lua-language-server"}
--   },
-- }
-- lspconfig.sumneko_lua.setup{luadev}

lspconfig.clangd.setup{
  init_options = { clangdFileStatus = true },
  settings = {
    cmd = { "clangd",
              "-j=10",
              "--clang-tidy" ,
              "--suggest-missing-includes" ,
              "--cross-file-rename"
          }
  }
}
