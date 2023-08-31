-- vim:foldmethod=marker

local lspconfig = require("lspconfig")
local configs = require 'lspconfig.configs'


-- You can specify the capabilities to exclude snippets explicitly like this
-- but in my experience it is not necessary:
--
--    local capabilities = require("cmp_nvim_lsp").update_capabilities(
--      vim.lsp.protocol.make_client_capabilities()
--    )
--    capabilities.textDocument.completion.snippetSupport = false

lspconfig.gopls.setup{}

lspconfig.vimls.setup{}

lspconfig.typst_lsp.setup{
  root_dir = function(path)
    local strip_dir_pat = '/([^/]+)$'
    local strip_sep_pat = '/$'
    if not path or #path == 0 then
      return
    end
    local result = path:gsub(strip_sep_pat, ''):gsub(strip_dir_pat, '')
    if #result == 0 then
      if vim.loop.os_uname().version:match 'Windows' then
        return path:sub(1, 2):upper()
      else
        return '/'
      end
    end
    return result
  end,
}

lspconfig.bashls.setup{}

lspconfig.pylsp.setup{}

-- lspconfig.jdtls.setup{}

lspconfig.jsonls.setup{}

--Enable (broadcasting) snippet capability for completion
local html_caps = vim.lsp.protocol.make_client_capabilities()
html_caps.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = html_caps,
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      telemetry = { enable = false, }, -- 😠
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

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

-- spdx-lsp
if not configs.spdx_lsp then
  configs.spdx_lsp = {
    default_config = {
      cmd = {'/home/jhen/repositories/silwerboom/silwerboom'};
      filetypes = {'spdx'};
      root_dir = function(fname)
        return lspconfig.util.path.dirname(fname)
      end;
      settings = {};
    };
  }
end
lspconfig.spdx_lsp.setup{}

if not configs.muddles then
  configs.muddles = {
    default_config = {
      cmd = {'/home/ztf/repositories/muddles/target/debug/muddles'};
      filetypes = {'mud'};
      root_dir = function(fname)
        return lspconfig.util.path.dirname(fname)
      end;
      settings = {};
    };
  }
end
lspconfig.muddles.setup{}
