local base_theme = require('ztf.colorscheme').mappings()

require 'lualine'.setup({
  options = {
    icons_enabled = true,
    theme = {
      normal = {
        a = { bg = base_theme.Pmenu.bg, fg = base_theme.Pmenu.fg, gui = 'bold' },
        b = { bg = base_theme.StatusLine.bg, fg = base_theme.StatusLine.fg },
        c = { bg = base_theme.Tabline.bg, fg = base_theme.Tabline.fg },
      },
      insert = {
        a = { bg = base_theme.PmenuSel.bg, fg = base_theme.PmenuSel.fg, gui = 'bold' },
        b = { bg = base_theme.StatusLine.bg, fg = base_theme.StatusLine.fg },
        c = { bg = base_theme.Tabline.bg, fg = base_theme.Tabline.fg },
      },
      visual = {
        a = { bg = base_theme.Visual.bg, fg = base_theme.Visual.fg, gui = 'bold' },
        b = { bg = base_theme.StatusLine.bg, fg = base_theme.StatusLine.fg },
        c = { bg = base_theme.Tabline.bg, fg = base_theme.Tabline.fg },
      },
      replace = {
        a = { bg = base_theme.PmenuSel.bg, fg = base_theme.PmenuSel.fg, gui = 'bold' },
        b = { bg = base_theme.StatusLine.bg, fg = base_theme.StatusLine.fg },
        c = { bg = base_theme.Tabline.bg, fg = base_theme.Tabline.fg },
      },
      command = {
        a = { bg = base_theme.Search.bg, fg = base_theme.Search.fg, gui = 'bold' },
        b = { bg = base_theme.StatusLine.bg, fg = base_theme.StatusLine.fg },
        c = { bg = base_theme.Tabline.bg, fg = base_theme.Tabline.fg },
      },
      -- TODO: inactive = { },
    },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      { 'diff',
        diff_color = {
          added    = { fg = 'green'  },
          modified = { fg = 'orange' },
          removed  = { fg = 'red'    },
        }, 
      },
      'diagnostics',
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
