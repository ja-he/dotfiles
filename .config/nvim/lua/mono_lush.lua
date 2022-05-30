local lush = require('lush')
local hsl = lush.hsl

-- CONVERTED RGB HEX COLOR CODES
--
--               PALE    VIBRANT DARK
--     red       #ffcccc #ff1414 #a30000
--     green     #c2edab #61c52b #3a751a
--     yellow    #fff0cc #ffb914 #cc8f00
--     blue      #ccebff #14a5ff #0065a3
--     pink      #ffccf7 #f500d0 #a3008b
--     turquoise #ccffe6 #00f57e #00a354

local bg_lightness = 100
local marker_lightness = bg_lightness * 0.9

local pale_yellow       = hsl(42, 100, marker_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_red          = hsl(0, 100, marker_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_green        = hsl(99, 64, marker_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_blue         = hsl(203, 100, marker_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_pink         = hsl(309, 100, marker_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to
local pale_turquoise    = hsl(151, 100, marker_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to

local vibrant_yellow    = pale_yellow.darken(40)
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

local white             = hsl(0, 0, bg_lightness)  -- Vim has a mapping, <n>C-a and <n>C-x to
local black             = hsl(0, 0, 0)  -- Vim has a mapping, <n>C-a and <n>C-x to
local off_white         = white.darken(3)
local light_grey        = white.darken(10)
local grey              = white.darken(20)
local dark_grey         = white.darken(30)

local theme = lush(function()
  return {

    -- Pre

    PaleYellowBlock        {  fg  =  pale_yellow       ,bg  =  pale_yellow        },
    PaleRedBlock           {  fg  =  pale_red          ,bg  =  pale_red           },
    PaleGreenBlock         {  fg  =  pale_green        ,bg  =  pale_green         },
    PaleBlueBlock          {  fg  =  pale_blue         ,bg  =  pale_blue          },
    PalePinkBlock          {  fg  =  pale_pink         ,bg  =  pale_pink          },
    PaleTurquoiseBlock     {  fg  =  pale_turquoise    ,bg  =  pale_turquoise     },

    VibrantYellowBlock     {  fg  =  vibrant_yellow    ,bg  =  vibrant_yellow     },
    VibrantRedBlock        {  fg  =  vibrant_red       ,bg  =  vibrant_red        },
    VibrantGreenBlock      {  fg  =  vibrant_green     ,bg  =  vibrant_green      },
    VibrantBlueBlock       {  fg  =  vibrant_blue      ,bg  =  vibrant_blue       },
    VibrantPinkBlock       {  fg  =  vibrant_pink      ,bg  =  vibrant_pink       },
    VibrantTurquoiseBlock  {  fg  =  vibrant_turquoise ,bg  =  vibrant_turquoise  },

    DarkYellowBlock        {  fg  =  dark_yellow       ,bg  =  dark_yellow        },
    DarkRedBlock           {  fg  =  dark_red          ,bg  =  dark_red           },
    DarkGreenBlock         {  fg  =  dark_green        ,bg  =  dark_green         },
    DarkBlueBlock          {  fg  =  dark_blue         ,bg  =  dark_blue          },
    DarkPinkBlock          {  fg  =  dark_pink         ,bg  =  dark_pink          },
    DarkTurquoiseBlock     {  fg  =  dark_turquoise    ,bg  =  dark_turquoise     },

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

    PaleYellowBackground        {  bg  =  pale_yellow        },
    PaleRedBackground           {  bg  =  pale_red           },
    PaleGreenBackground         {  bg  =  pale_green         },
    PaleBlueBackground          {  bg  =  pale_blue          },
    PalePinkBackground          {  bg  =  pale_pink          },
    PaleTurquoiseBackground     {  bg  =  pale_turquoise     },

    VibrantYellowBackground     {  bg  =  vibrant_yellow     },
    VibrantRedBackground        {  bg  =  vibrant_red        },
    VibrantGreenBackground      {  bg  =  vibrant_green      },
    VibrantBlueBackground       {  bg  =  vibrant_blue       },
    VibrantPinkBackground       {  bg  =  vibrant_pink       },
    VibrantTurquoiseBackground  {  bg  =  vibrant_turquoise  },

    DarkYellowBackground        {  bg  =  dark_yellow        },
    DarkRedBackground           {  bg  =  dark_red           },
    DarkGreenBackground         {  bg  =  dark_green         },
    DarkBlueBackground          {  bg  =  dark_blue          },
    DarkPinkBackground          {  bg  =  dark_pink          },
    DarkTurquoiseBackground     {  bg  =  dark_turquoise     },

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
    Visual        { bg = pale_yellow },
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
    Error         { fg = dark_red , bg = pale_red }, -- (preferred) any erroneous construct
    ErrorMsg      { Error }, -- error messages on the command line
    FoldColumn    { Whitespace }, -- 'foldcolumn'
    SignColumn    { }, -- column where |signs| are displayed
    Substitute    { }, -- |:substitute| replacement text highlighting
    Delimiter     { fg = dark_grey },
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
    Comment     { fg = dark_grey },
    Todo        { bg = pale_red },

    String      { fg = dark_green },
    Character   { String }, --  a character constant: 'c', '\n'
    Boolean     { String }, --  a boolean constant: TRUE, false
    Number      { String }, --   a number constant: 234, 0xff
    Float       { Number }, --    a floating point constant: 2.3e10
    Constant    { String, gui = "underline" },

    Identifier  { gui = "bold"},
    Function    { Identifier }, -- function name (also: methods for classes)

    Statement   { fg = black, gui = "bold,italic" },
    Keyword     { fg = black, gui = "italic" },
    Conditional { Keyword }, --  if, then, else, endif, switch, etc.
    Repeat      { Keyword }, --   for, do, while, etc.
    Label       { Keyword }, --    case, default, etc.
    Operator    { fg = dark_blue }, -- "sizeof", "+", "*", etc.
    Exception   { Keyword }, --  try, catch, throw

    Type        { gui = "underline" },
    StorageClass{ Type }, -- static, register, volatile, etc.
    Typedef     { Type }, --  A typedef
    Structure   { gui = "italic" }, --  struct, union, enum, etc.

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
    DiagnosticError       { fg = vibrant_red }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextError { DiagnosticError },
    DiagnosticSignError { fg = DiagnosticError.fg.darken(40), bg = DiagnosticError.fg.lighten(80) },


    DiagnosticWarn        { fg = vibrant_yellow }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextWarn { DiagnosticWarn },
    DiagnosticFloatingWarn { fg = DiagnosticWarn.fg.darken(40) },
    DiagnosticSignWarn { fg = DiagnosticWarn.fg.darken(40), bg = DiagnosticWarn.fg.lighten(80) },


    DiagnosticInfo        { fg = vibrant_blue }, -- Used for "Information" diagnostic virtual text

    DiagnosticHint        { fg = vibrant_pink }, -- Used for "Hint" diagnostic virtual text

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    TSError              {  }, -- For syntax/parser errors.
    TSPunctDelimiter     { Delimiter }, -- For delimiters ie: `.`
    TSPunctBracket       { fg = dark_grey }, -- For brackets and parens.
    TSPunctSpecial       { Delimiter }, -- For special punctutation that does not fall in the catagories before.
    TSConstant           { Constant }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    TSString             { String }, -- For strings.
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
    TSConstructor        { TSMethod , gui = "italic" }, -- For constructor calls and definitions: `{ }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    TSKeyword            { Keyword }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    TSType               { Type }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    TSNamespace          { Type, fg = Comment.fg }, -- For identifiers referring to modules and namespaces.
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

    manOptionDesc { Title },

    -- Plugins

      -- scrollview
      ScrollView { bg = pale_blue },

      -- fugitive
      diffRemoved               { DiffDelete },
      diffAdded                 { DiffAdd },
      diffChanged               { DiffChange },
      fugitiveUntrackedModifier { fg = dark_red    },
      fugitiveUnstagedModifier  { fg = dark_yellow },
      fugitiveStagedModifier    { fg = dark_green  },
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

      -- neogit
      NeogitUntrackedfiles { fugitiveUntrackedModifier, gui = "bold,underline" },
      NeogitUnstagedchanges { fugitiveUnstagedModifier, gui = "bold,underline" },
      NeogitStagedchanges { fugitiveStagedModifier, gui = "bold,underline" },
      NeogitStashes { Operator, gui = "bold,underline" },

      -- signify
      SignifySignAdd             { bg = pale_green  , fg = dark_green   },
      SignifySignChange          { bg = pale_yellow , fg = dark_yellow  },
      SignifySignDelete          { bg = pale_red    , fg = dark_red     },
      SignifySignChangeDelete    { SignifySignChange },
      SignifySignDeleteFirstLine { SignifySignDelete },

      -- gitsigns
      GitSignsAdd                { SignifySignAdd },
      GitSignsChange             { SignifySignChange },
      GitSignsDelete             { SignifySignDelete },
      GitSignsAddFG              { fg = SignifySignAdd.fg },
      GitSignsChangeFG           { fg = SignifySignChange.fg },
      GitSignsDeleteFG           { fg = SignifySignDelete.fg },

      -- WhichKey
      WhichKey          { SpecialKey , gui = "bold" },
      WhichKeySeperator { fg = dark_grey },
      WhichKeyGroup     { Operator       , gui = "" },
      WhichKeyDesc      { WhichKeyGroup , gui = "bold" },
      WhichKeyFloating  { NormalFloat },

      -- Floaterm
      Floaterm { bg = NormalFloat.bg },
      FloatermBorder { NormalFloat },

      -- nvim-tree
      -- NOTE: these are undocumented in the help
      NvimTreeNormal { bg = off_white },
      NvimTreeGitIgnored { fg = dark_grey },
      NvimTreeCursorLine { bg = light_grey },
      NvimTreeStatusLine { StatusLine },
      NvimTreeStatusLineNC { StatusLineNC },
      -- NOTE: these ones are documented
      NvimTreeSymlink { VibrantTurquoiseText },
      NvimTreeFolderName { VibrantBlueText, gui = "bold" },
      NvimTreeRootFolder { },
      NvimTreeFolderIcon { },
      NvimTreeEmptyFolderName { NvimTreeFolderName },
      NvimTreeOpenedFolderName { NvimTreeFolderName },
      NvimTreeExecFile { VibrantGreenText },
      NvimTreeOpenedFile { },
      NvimTreeSpecialFile { },
      NvimTreeImageFile { },
      NvimTreeMarkdownFile { },
      NvimTreeIndentMarker { Whitespace },
      -- NOTE: I believe these next few are only for icons
      --NvimTreeGitDirty {},
      --NvimTreeGitStaged {},
      --NvimTreeGitMerge { },
      --NvimTreeGitRenamed { },
      --NvimTreeGitNew { },
      --NvimTreeGitDeleted { },
      -- NOTE: I believe these next ones are for the filenames
      NvimTreeFileDirty { DiffChange },
      NvimTreeFileStaged { DiffAdd },
      NvimTreeFileNew { DiffDelete},
      NvimTreeFileMerge { DiffText },
      NvimTreeFileRenamed { NvimTreeFileDirty },
      NvimTreeFileDeleted { NvimTreeFileDirty },

      -- telescope
      TelescopeNormal         { fg = Normal.fg, bg = diffChanged.bg },
      TelescopeBorder         { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },
      TelescopeNormalBorder   { TelescopeNormal },
      TelescopeSelection      { TelescopeNormal, bg = TelescopeNormal.bg.darken(10) },
      TelescopeSelectionCaret { TelescopeSelection, fg = TelescopeSelection.bg.darken(60) , gui = 'bold' },
      TelescopeTitle          { fg = TelescopeNormal.bg.darken(70), bg = TelescopeNormal.bg.darken(20) , gui = "italic"},
      TelescopeMatching       { fg = TelescopeNormal.bg.darken(70), bg = TelescopeSelection.bg.darken(10) , gui = "bold"},

      TelescopePromptNormal   { fg = black, bg = pale_green },
      TelescopePromptBorder   { fg = TelescopePromptNormal.bg, bg = TelescopePromptNormal.bg },
      TelescopePromptTitle    { fg = TelescopePromptNormal.bg.darken(70), bg = TelescopePromptNormal.bg.darken(20), gui = "italic" },
      TelescopePromptCounter  { fg = TelescopePromptNormal.bg.darken(70) },
      TelescopePromptPrefix   { TelescopePromptCounter, gui = 'bold' },

      TelescopePreviewNormal  { fg = Normal.fg, bg = off_white },
      TelescopePreviewBorder  { TelescopePreviewNormal },
      TelescopePreviewTitle   { fg = TelescopePreviewNormal.bg.darken(70), bg = TelescopePreviewNormal.bg.darken(20), gui = "italic" },
      TelescopePreviewMessage { fg = TelescopePreviewNormal.bg.darken(40) },

			GocNormal    { bg = light_grey },
			GocUncovered { bg = pale_red },
			GocCovered   { bg = pale_green },
  }
end)

return theme

-- vi:nowrap:number
