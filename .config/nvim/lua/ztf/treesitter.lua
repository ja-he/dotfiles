require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.spdxtv = {
  install_info = {
    url = "~/repositories/ts-test/parser/tree-sitter-fakelang", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "spdx", -- if filetype does not match the parser name
  highlight = true,
}
