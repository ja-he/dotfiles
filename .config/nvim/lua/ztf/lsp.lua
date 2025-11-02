-- vim:foldmethod=marker

-- You can specify the capabilities to exclude snippets explicitly like this
-- but in my experience it is not necessary:
--
--    local capabilities = require("cmp_nvim_lsp").update_capabilities(
--      vim.lsp.protocol.make_client_capabilities()
--    )
--    capabilities.textDocument.completion.snippetSupport = false

vim.lsp.enable('gopls')

vim.lsp.enable('vimls')

-- tinymist is an LS for typst
vim.lsp.config['tinymist'] = {
  offset_encoding = "utf-8",
  settings = {
    exportPdf = "onSave", -- onSave/onType
    outputPath = "$root/live/$dir/$name",
    systemFonts = true,
  },
  root_markers = { 'main.typ' },
}
vim.lsp.enable('tinymist')

vim.lsp.enable('bashls')

vim.lsp.enable('pylsp')
vim.lsp.enable('pyright')
-- vim.lsp.enable('jdtls')
vim.lsp.enable('ruff')

vim.lsp.enable('jsonls')

vim.lsp.config['yamlls'] = {
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}

--Enable (broadcasting) snippet capability for completion
local html_caps = vim.lsp.protocol.make_client_capabilities()
html_caps.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config['html'] = {
  capabilities = html_caps,
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  },
}
vim.lsp.enable('html')
vim.lsp.config['cssls'] = {
  capabilities = html_caps,
}
vim.lsp.enable('cssls')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
vim.lsp.config['lua_ls'] = {
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
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
vim.lsp.enable('lua_ls')

vim.lsp.config['clangd'] = {
  init_options = { clangdFileStatus = true },
  settings = {
    cmd = { "clangd",
      "-j=10",
      "--clang-tidy",
      "--suggest-missing-includes",
      "--cross-file-rename"
    }
  }
}
vim.lsp.enable('clangd')

-- spdx-lsp
vim.lsp.config('spdx_lsp', {
  cmd = { '/home/jhen/repositories/silwerboom/silwerboom' },
  filetypes = { 'spdx' },
  root_markers = { '.git' },
  settings = {},
})
vim.lsp.enable('spdx_lsp')

vim.lsp.config('muddles', {
  cmd = { '/home/ztf/repositories/muddles/target/debug/muddles' },
  filetypes = { 'mud' },
  root_markers = { '.git' },
  settings = {},
})
vim.lsp.enable('muddles')

vim.lsp.config['harper_ls'] = {
  settings = {
    ["harper-ls"] = {
      userDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = false,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 300000
    }
  }
}
vim.lsp.enable('harper_ls')
