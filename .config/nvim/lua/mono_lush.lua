local lush = require('lush')
local hsl = lush.hsl

local pale_yellow       = hsl(42, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_red          = hsl(0, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_green        = hsl(99, 64, 80)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_blue         = hsl(203, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_pink         = hsl(309, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_turquoise    = hsl(151, 100, 90)  -- Vim has a mapping, <n>C-a and <n>C-x to

local vibrant_yellow    = pale_yellow.darken(55)
local vibrant_red       = pale_red.darken(40)
local vibrant_green     = pale_green.darken(41)
local vibrant_blue      = pale_blue.darken(40)
local vibrant_pink      = pale_pink.darken(47)
local vibrant_turquoise = pale_turquoise.darken(47)

local dark_yellow       = pale_yellow.darken(55)
local dark_red          = pale_red.darken(65)
local dark_green        = pale_green.darken(65)
local dark_blue         = pale_blue.darken(65)
local dark_pink         = pale_pink.darken(65)
local dark_turquoise    = pale_turquoise.darken(65)

local white             = hsl(0, 0, 100)  -- Vim has a mapping, <n>C-a and <n>C-x to
local black             = hsl(0, 0, 0)  -- Vim has a mapping, <n>C-a and <n>C-x to
local off_white         = white.darken(3)
local light_grey        = white.darken(10)
local grey              = white.darken(20)
local dark_grey         = white.darken(30)

local theme = lush(function()
  return {

    -- Pre

    PaleYellowText        {  fg  =  pale_yellow        },
    PaleRedText           {  fg  =  pale_red           },
    PaleGreenText         {  fg  =  pale_green         },
    PaleBlueText          {  fg  =  pale_blue          },
    PalePinkText          {  fg  =  pale_pink          },
    PaleTurquoiseText     {  fg  =  pale_turquoise     },

    VibrantYellowText     {  fg  =  vibrant_yellow     },
    VibrantRedText        {  fg  =  vibrant_red        },
    VibrantGreenText      {  fg  =  vibrant_green      },
    VibrantBlueText       {  fg  =  vibrant_blue       },
    VibrantPinkText       {  fg  =  vibrant_pink       },
    VibrantTurquoiseText  {  fg  =  vibrant_turquoise  },

    DarkYellowText        {  fg  =  dark_yellow        },
    DarkRedText           {  fg  =  dark_red           },
    DarkGreenText         {  fg  =  dark_green         },
    DarkBlueText          {  fg  =  dark_blue          },
    DarkPinkText          {  fg  =  dark_pink          },
    DarkTurquoiseText     {  fg  =  dark_turquoise     },

    -- Defs

    Normal        { fg = black , bg = white },
    NormalFloat   { Normal , bg = light_grey }, -- Normal text in floating windows.
    NormalNC      { Normal }, -- normal text in non-current windows

    -- Line Numbers
    CursorLineNr  { fg = dark_grey , gui = "bold" },
    LineNr        { fg = grey },

    -- Cursor
    Cursor        { }, -- character under the cursor
    lCursor       { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM      { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine    { bg = off_white },
    CursorColumn  { CursorLine },
    TermCursor    { bg = black, fg = white }, -- cursor in a focused terminal
    TermCursorNC  { bg = TermCursor.bg.lighten(40) }, -- cursor in an unfocused terminal

    -- UI
    ColorColumn   { CursorLine }, -- used for the columns set with 'colorcolumn'
    StatusLine    { fg = dark_grey.darken(20)  , bg = light_grey , gui = "bold" },
    StatusLineNC  { fg = dark_grey , bg = off_white },
    VertSplit     { fg = StatusLineNC.bg , bg = StatusLineNC.bg },
    Tabline       { StatusLineNC },
    TablineSel    { StatusLine },
    TablineFill   { VertSplit },

    -- "Above the text"
    Visual        { bg = pale_blue },
    Search        { bg = pale_pink }, -- TODO: color
    IncSearch     { bg = Search.bg.darken(20) },

    -- Invisible text
    Conceal       { fg = dark_red }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Whitespace    { fg = pale_blue },
    Folded        { Whitespace }, -- line used for closed folds
    NonText       { Whitespace }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    -- More default stuff:
    Directory     { }, -- directory names (and other special names in listings)
    DiffAdd       { bg = pale_green }, -- diff mode: Added line |diff.txt|
    DiffChange    { bg = pale_yellow }, -- diff mode: Changed line |diff.txt|
    DiffDelete    { bg = pale_red }, -- diff mode: Deleted line |diff.txt|
    DiffText      { bg = DiffDelete.bg.darken(15) }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer   { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    Ignore        { Whitespace }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error         { fg = white , bg = vibrant_red }, -- (preferred) any erroneous construct
    ErrorMsg      { Error }, -- error messages on the command line
    FoldColumn    { Whitespace }, -- 'foldcolumn'
    SignColumn    { }, -- column where |signs| are displayed
    Substitute    { }, -- |:substitute| replacement text highlighting
    Delimiter     { fg = grey },
    MatchParen    { bg = pale_turquoise, fg = Delimiter.fg.darken(80) }, -- TODO: maybe light bg, darker fg?
    ModeMsg       { fg = grey }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea       { }, -- Area for messages and cmdline
    MsgSeparator  { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg       { }, -- |more-prompt|
    Pmenu         { bg = NormalFloat.bg , fg = Normal.fg.lighten(60) }, -- Popup menu: normal item.
    PmenuSel      { bg = Pmenu.bg.darken(2)       , fg = Pmenu.fg.darken(40) , gui = "bold" }, -- Popup menu: selected item.
    PmenuSbar     { bg = Pmenu.bg }, -- Popup menu: scrollbar.
    PmenuThumb    { bg = PmenuSbar.bg.darken(20) }, -- Popup menu: Thumb of the scrollbar.
    Question      { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine  { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey    { fg = dark_red }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad      { bg = pale_red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap      { bg = pale_yellow }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal    { bg = pale_green }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare     { bg = pale_blue }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    VisualNOS     { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg    { }, -- warning messages
    WildMenu      { DiffDelete }, -- current match in 'wildmenu' completion

    -- Code and markup
    Comment     { fg = grey },
    Todo        { bg = pale_red },

    Constant    { fg = dark_green },
    String      { Constant },
    Character   { Constant }, --  a character constant: 'c', '\n'
    Number      { Constant }, --   a number constant: 234, 0xff
    Boolean     { Constant }, --  a boolean constant: TRUE, false
    Float       { Number }, --    a floating point constant: 2.3e10

    Identifier  { gui = "bold"},
    Function    { Identifier }, -- function name (also: methods for classes)

    Statement   { fg = black, gui = "bold,italic" },
    Keyword     { fg = black, gui = "italic" },
    Conditional { Keyword }, --  if, then, else, endif, switch, etc.
    Repeat      { Keyword }, --   for, do, while, etc.
    Label       { Keyword }, --    case, default, etc.
    Operator    { fg = dark_blue }, -- "sizeof", "+", "*", etc.
    Exception   { Keyword }, --  try, catch, throw

    Type        { fg = dark_red, gui = "bold" },
    StorageClass{ Type }, -- static, register, volatile, etc.
    Typedef     { Type }, --  A typedef
    Structure   { Delimiter }, --  struct, union, enum, etc.

    PreProc     { gui = "italic" },
    Include     { PreProc }, --  preprocessor #include
    Define      { PreProc }, --   preprocessor #define
    Macro       { PreProc }, --    same as Define
    PreCondit   { PreProc }, --  preprocessor #if, #else, #endif, etc.

    Special        { fg = String.fg.desaturate(40) }, -- (preferred) any special symbol
    SpecialChar    { Special }, --  special character in a constant
    Tag            { Special }, --    you can use CTRL-] on this
    SpecialComment { fg = Comment.fg.darken(30) }, -- special things inside a comment
    Debug          { Special }, --    debugging statements

    Title         { fg = dark_red, gui = "bold" },
    Underlined    { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold          { gui = "bold" },
    Italic        { gui = "italic" },


    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText                     { fg = vibrant_red }, -- used for highlighting "text" references
    LspReferenceRead                     { fg = vibrant_red }, -- used for highlighting "read" references
    LspReferenceWrite                    { fg = vibrant_red }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { fg = red_base.darken(60)   }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultWarning         { fg = orange_base.darken(60)}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultInformation     { fg = blue_base.darken(60)  }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultHint            { fg = green_base.darken(60) }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError       { fg = vibrant_red }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning     { fg = vibrant_yellow }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation { fg = vibrant_blue }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint        { fg = vibrant_green }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError         { fg = LspDiagnosticsVirtualTextError.fg.darken(20) , gui = "underline" }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { fg = LspDiagnosticsVirtualTextWarning.fg.darken(20) , gui = "underline" }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { fg = LspDiagnosticsVirtualTextInformation.fg.darken(20) , gui = "underline" }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint          { fg = LspDiagnosticsVirtualTextHint.fg.darken(20) , gui = "underline" }, -- Used to underline "Hint" diagnostics

    LspDiagnosticsFloatingError          { bg = NormalFloat.bg , fg = LspDiagnosticsVirtualTextError.fg }, -- Used to color "Error" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingWarning        { bg = NormalFloat.bg , fg = LspDiagnosticsVirtualTextWarning.fg }, -- Used to color "Warning" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingInformation    { bg = NormalFloat.bg , fg = LspDiagnosticsVirtualTextInformation.fg }, -- Used to color "Information" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingHint           { bg = NormalFloat.bg , fg = LspDiagnosticsVirtualTextHint.fg }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column


    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    TSError              { Error }, -- For syntax/parser errors.
    TSPunctDelimiter     { Delimiter }, -- For delimiters ie: `.`
    TSPunctBracket       { Delimiter }, -- For brackets and parens.
    TSPunctSpecial       { Delimiter }, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    TSFunction           { Function }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSParameter          { Identifier }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    TSMethod             { Function }, -- For method calls and definitions.
    -- TSField              { }, -- For fields.
    -- TSProperty           { }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `{ }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    TSKeyword            { Keyword }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    TSType               { Type }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    TSNamespace          { Delimiter }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    TSURI                { fg = dark_blue }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.

    -- Plugins

      -- scrollview
      ScrollView { bg = light_grey },

      -- fugitive
      diffRemoved               { DiffDelete },
      diffAdded                 { DiffAdd },
      diffChanged               { DiffChange },
      fugitiveUntrackedModifier { fg = vibrant_red },
      fugitiveUnstagedModifier  { fg = vibrant_yellow },
      fugitiveStagedModifier    { fg = vibrant_green },
      -- diffOnly                 {},
      -- diffIdentical            {},
      -- diffDiffer               {},
      -- diffBDiffer              {},
      -- diffIsA                  {},
      -- diffNoEOL                {},
      -- diffCommon               {},
      -- diffSubname              {},
      -- diffLine                 {},
      -- diffFile                 {},
      -- diffOldFile              {},
      -- diffNewFile              {},
      -- diffIndexLine            {},
      -- diffComment              {},
      -- fugitiveHash             {},
      -- fugitiveSymbolicRef      {},
      -- fugitiveHeader           {},
      -- fugitiveBareHeader       {},
      -- fugitiveHelpTag          {},
      -- fugitiveHelpHeader       {},
      -- fugitiveHeading          {},
      -- fugitiveSection          {},
      -- fugitivePreposition      {},
      -- fugitiveCount            {},
      -- fugitiveInstruction      {},
      -- fugitiveDone             {},
      -- fugitiveStop             {},
      -- fugitiveModifier         {},
      -- fugitiveHunk             {},
      -- fugitiveUntrackedHeading {},
      -- fugitiveUntrackedSection {},
      -- fugitiveUnstagedHeading  {},
      -- fugitiveUnstagedSection  {},
      -- fugitiveStagedHeading    {},
      -- fugitiveStagedSection    {},

      -- WhichKey
      WhichKey          { gui = "bold" },
      WhichKeySeperator { Pmenu },
      WhichKeyGroup     { Pmenu , gui = "italic" },
      WhichKeyDesc      { PmenuSel , gui = "italic" },
      WhichKeyFloating  { PmenuSel },

      -- Floaterm
      Floaterm { bg = NormalFloat.bg },
      FloatermBorder { NormalFloat },

  }
end)

return theme

-- vi:nowrap:number
