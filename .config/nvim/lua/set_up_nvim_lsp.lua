local lspconfig = require('lspconfig')
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = false,
    update_in_insert = true,
  }
)

local completion = require('completion')

local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config{
  status_symbol = "LSP:";
  indicator_errors = "E:";
  indicator_warnings = "W:";
  indicator_info = "I:";
  indicator_hint = "H:";
  indicator_ok = "OK";
}

function attach_stuff (client)
  print("lsp started, attaching...")
  lsp_status.on_attach(client)
  completion.on_attach(client)
  print("done attaching.")
end

lspconfig.clangd.setup{
  on_attach = attach_stuff,
  init_options = { clangdFileStatus = true },
  capabilities = lsp_status.capabilities,
  settings = {
    cmd = { "clangd", 
              "-j=10",
              "--clang-tidy" ,
              "--suggest-missing-includes" ,
              "--cross-file-rename"
          }
  }
}

lspconfig.bashls.setup{on_attach = attach_stuff}

-- lspconfig.jedi_language_server.setup{on_attach = attach_stuff}
lspconfig.pyls.setup{on_attach = attach_stuff} -- FUCK PALANTIR!

lspconfig.vimls.setup{on_attach = attach_stuff}

lspconfig.texlab.setup{on_attach = attach_stuff}
