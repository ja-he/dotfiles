local lush = require('lush')
local hsl = lush.hsl

local pale_yellow  = hsl(42, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_red  = hsl(0, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_green  = hsl(99, 64, 80)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_blue  = hsl(203, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to

local dark_blue = hsl(200,80,35)
local dark_red = hsl(0,80,35)

local white  = hsl(2, 50, 100)  -- Vim has a mapping, <n>C-a and <n>C-x to
local black  = hsl(0, 0, 0)  -- Vim has a mapping, <n>C-a and <n>C-x to

local theme = lush(function()
  return {

    VibrantRedText { fg = pale_red.darken(30) },
    VibrantGreenText {  fg = pale_green.darken(30) },
    VibrantBlueText {  fg = pale_blue.darken(30) },
    VibrantYellowText {  fg = pale_yellow.darken(30) },

    Normal { bg = white, fg = black }, -- normal text

    CursorLine { bg = Normal.bg.darken(2) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine },

    Whitespace { fg = Normal.fg.lighten(85) },

    LineNr       { fg = Whitespace.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = LineNr.fg , bg = CursorLine.bg.darken(0),gui="bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    Visual { bg = pale_yellow },

    search_base  { bg = pale_green },
    Search       { search_base },
    IncSearch    { bg = search_base.bg.ro(-20) },

    ColorColumn { CursorLine },
    StatusLine { bg = CursorLine.bg , fg = Normal.fg },
    StatusLineNC { bg = StatusLine.bg , fg = StatusLine.fg.li(80) },
    VertSplit { bg = StatusLineNC.bg, fg = StatusLineNC.bg },

    Comment { Whitespace, gui="italic" },
    Todo { fg = VibrantRedText.fg , bg = pale_red, gui="italic" }, -- TODO: this should be highlighted, if it ain't we might have to wait on nvim-treesitter/issues/236 a bit longer...
    Constant { fg = dark_red },
    String { Comment, gui="bold" },
    Statement { fg = Normal.fg, gui="bold" },
    Type { fg = Normal.fg, gui="underline" },
    PreProc { fg = Whitespace.fg, gui="bold" },
    Special { fg = dark_blue },
    Identifier { Special , gui="bold"},
    Delimiter { fg = Whitespace.fg.darken(10) },
    MatchParen { fg = Delimiter.fg.darken(50), bg = pale_blue },

    EndOfBuffer { bg = Normal.bg, fg = Normal.bg },

    Tabline { StatusLineNC },
    TablineSel { StatusLine },
    TablineFill { VertSplit },
    Title { StatusLineNC },

    Folded { fg = pale_blue.darken(10) },
    NonText { Folded },

    Pmenu { fg = Normal.fg, bg = pale_red },
    PmenuSel { fg = Normal.fg, bg = pale_blue , gui = "bold"},
    PmenuSbar { fg = Pmenu.bg, bg = Pmenu.bg },
    PmenuThumb { fg = Pmenu.bg.darken(20), bg = Pmenu.bg.darken(5) },

    SignColumn { Normal },
    DiffAdd { bg = pale_green },
    DiffDelete { bg = pale_red },
    DiffChange { bg = pale_yellow },

    diffAdded { DiffAdd },
    diffRemoved { DiffDelete },

    LspDiagnosticsDefaultError { VibrantRedText },
    LspDiagnosticsDefaultHint { VibrantGreenText },
    LspDiagnosticsDefaultInformation { VibrantBlueText },
    LspDiagnosticsDefaultWarning { VibrantYellowText },

    fugitiveUntrackedModifier { VibrantYellowText , gui = "bold"},
    fugitiveUnstagedModifier { VibrantRedText , gui = "bold"},
    fugitiveStagedModifier { VibrantGreenText, gui = "bold" },

    Conceal { Special },

    pandocAtxHeader { Identifier, gui = "bold,underline" },
    pandocAtxStart  { pandocAtxHeader },
    pandocEmphasis  { gui = "italic" },

  -- Math guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  -- Conceal guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  -- DiffText guifg=NONE guibg=#ccffff gui=bold,reverse cterm=bold,reverse
  -- Directory guifg=#004488 guibg=NONE gui=bold,underline cterm=bold,underline
  -- ErrorMsg guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  -- WarningMsg guifg=#ee9900 guibg=NONE gui=NONE cterm=NONE
  -- FoldColumn guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- ModeMsg guifg=#bbbbbb guibg=NONE gui=NONE cterm=NONE
  -- MoreMsg guifg=#ff0088 guibg=#ffffcc gui=NONE cterm=NONE
  -- Question guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- SpecialKey guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- SpellBad guifg=NONE guibg=#ffcccc gui=NONE cterm=NONE
  -- SpellCap guifg=NONE guibg=#ffffcc gui=NONE cterm=NONE
  -- SpellLocal guifg=NONE guibg=#ffccff gui=NONE cterm=NONE
  -- SpellRare guifg=NONE guibg=#ccffff gui=NONE cterm=NONE
  -- StatusLineNC guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- TabLine guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- TabLineFill guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- TabLineSel guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- VisualNOS guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- WildMenu guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- CodeListing guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  -- Constant guifg=#000099 guibg=NONE gui=bold cterm=bold
  -- Error guifg=NONE guibg=#ffcccc gui=NONE cterm=NONE
  -- Identifier guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  -- Ignore guifg=#ff0088 guibg=#ffcccc gui=NONE cterm=NONE
  -- Todo guifg=#cc0000 guibg=#ffcccc gui=italic cterm=italic
  -- Type guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  -- Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  -- CursorIM guifg=NONE guibg=fg gui=NONE cterm=NONE
  -- ToolbarLine guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
  -- ToolbarButton guifg=#ff0088 guibg=#ccffff gui=bold cterm=bold
  -- helpOption guifg=#004488 guibg=NONE gui=underline cterm=underline
  -- helpHyperTextJump guifg=#004488 guibg=NONE gui=bold,underline cterm=bold,underline
  -- helpHyperTextEntry guifg=#004488 guibg=NONE gui=bold cterm=bold
  -- helpCommand guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  -- LspDiagnosticsDefaultError guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  -- LspDiagnosticsDefaultHint guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  -- LspDiagnosticsDefaultInformation guifg=#00aa00 guibg=NONE gui=NONE cterm=NONE
  -- LspDiagnosticsDefaultWarning guifg=#ee9900 guibg=NONE gui=NONE cterm=NONE
  -- WhichKeySeperator guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  -- WhichKeyGroup guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  -- WhichKey guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  -- WhichKeyDesc guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  -- Scrollview guifg=#000000 guibg=#000000 gui=NONE cterm=NONE
  -- Todo gui=NONE cterm=NONE

  }
end)

return theme

-- vi:nowrap:number
