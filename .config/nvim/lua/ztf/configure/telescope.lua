require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-h>'] = "which_key",
        ['<C-d>'] = "close",
        ['<C-j>'] = "move_selection_next",
        ['<C-k>'] = "move_selection_previous",
      }
    },
    layout_config = {
       horizontal = {
          prompt_position = "bottom",
          preview_width = 0.5,
          results_width = 0.5,
       },
       vertical = {
          mirror = false,
       },
       width = 0.9,
       height = 0.9,
       preview_cutoff = 120,
    },
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    generic_sorter = require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = { ".git/" },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}
require('telescope').load_extension('fzf')
