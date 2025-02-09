require 'lualine'.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = { 'mode', 'selectioncount' },
    lualine_b = {
      'branch',
      {
        'diff',
        diff_color = {
          added    = { fg = 'green' },
          modified = { fg = 'orange' },
          removed  = { fg = 'red' },
        },
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1, -- relative path
      },
      'filesize',
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'diagnostics' },
    lualine_z = { 'searchcount', 'progress', 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
