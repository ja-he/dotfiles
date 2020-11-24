" Name:         Mono
" Description:  Template for a light colorscheme
" Author:       Myself <myself@somewhere.org>
" Maintainer:   Myself <myself@somewhere.org>
" Website:      https://me.org
" License:      Public domain
" Last Updated: So 22 Nov 2020 22:32:58 CET

" Generated by Colortemplate v2.1.0

set background=light

hi clear
let g:colors_name = 'mono'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PopupSelected PmenuSel
hi! link PreCondit PreProc
hi! link QuickFixLine Search
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor
hi! link diffRemoved DiffDelete
hi! link diffAdded DiffAdd
hi! link gitcommitOverflow DiffDelete
hi! link fugitiveUntrackedModifier DiffChange
hi! link fugitiveUnstagedModifier DiffDelete
hi! link fugitiveStagedModifier DiffAdd
hi! link IncSearch Search
hi! link helpExample helpCommand
hi! link VimwikiPre CodeListing
hi! link VimwikiCode CodeListing
hi! link VimwikiCodeChar Comment
hi! link VimwikiPreChar Comment
hi! link VimwikiHeaderChar Comment
hi! link VimwikiMarkers Comment

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#000000', '#cc0000', '#00aa00', '#ffff00',
        \ '#0000ff', '#ff00ff', '#00ffff', '#eeeeee', '#bbbbbb', '#ffcccc',
        \ '#ccffcc', '#ffffcc', '#ccccff', '#ffccff', '#ccffff', '#ffffff']
  if has('nvim')
    let g:terminal_color_0 = '#000000'
    let g:terminal_color_1 = '#cc0000'
    let g:terminal_color_2 = '#00aa00'
    let g:terminal_color_3 = '#ffff00'
    let g:terminal_color_4 = '#0000ff'
    let g:terminal_color_5 = '#ff00ff'
    let g:terminal_color_6 = '#00ffff'
    let g:terminal_color_7 = '#eeeeee'
    let g:terminal_color_8 = '#bbbbbb'
    let g:terminal_color_9 = '#ffcccc'
    let g:terminal_color_10 = '#ccffcc'
    let g:terminal_color_11 = '#ffffcc'
    let g:terminal_color_12 = '#ccccff'
    let g:terminal_color_13 = '#ffccff'
    let g:terminal_color_14 = '#ccffff'
    let g:terminal_color_15 = '#ffffff'
  endif
  if get(g:, 'mono_transp_bg', 0) && !has('gui_running')
    hi Normal guifg=#000000 guibg=NONE gui=NONE cterm=NONE
    hi Terminal guifg=#000000 guibg=NONE gui=NONE cterm=NONE
  else
    hi Normal guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
    hi Terminal guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  endif
  hi ColorColumn guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=reverse
  hi CursorColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi CursorLineNr guifg=NONE guibg=#eeeeee gui=bold cterm=bold
  hi DiffAdd guifg=NONE guibg=#ccffcc gui=NONE cterm=NONE
  hi DiffChange guifg=NONE guibg=#ffe5cc gui=NONE cterm=NONE
  hi DiffDelete guifg=NONE guibg=#ffcccc gui=NONE cterm=NONE
  hi DiffText guifg=NONE guibg=#ccffff gui=bold,reverse cterm=bold,reverse
  hi Directory guifg=#004488 guibg=NONE gui=bold,underline cterm=bold,underline
  hi EndOfBuffer guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  hi WarningMsg guifg=#ee9900 guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi Folded guifg=#bbbbbb guibg=NONE gui=italic cterm=italic
  hi LineNr guifg=#bbbbbb guibg=NONE gui=NONE cterm=NONE
  hi MatchParen guifg=NONE guibg=#ccccff gui=NONE cterm=NONE
  hi ModeMsg guifg=#bbbbbb guibg=NONE gui=NONE cterm=NONE
  hi MoreMsg guifg=#ff0088 guibg=#ffffcc gui=NONE cterm=NONE
  hi NonText guifg=#bbbbbb guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi PmenuSbar guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi PmenuSel guifg=#ff0088 guibg=#ccffff gui=reverse cterm=reverse
  hi PmenuThumb guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi Question guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi Search guifg=NONE guibg=#ccccff gui=NONE cterm=NONE
  hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi SpellBad guifg=NONE guibg=#ffcccc gui=NONE cterm=NONE
  hi SpellCap guifg=NONE guibg=#ffffcc gui=NONE cterm=NONE
  hi SpellLocal guifg=NONE guibg=#ffccff gui=NONE cterm=NONE
  hi SpellRare guifg=NONE guibg=#ccffff gui=NONE cterm=NONE
  hi StatusLine guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi StatusLineNC guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi TabLine guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi TabLineFill guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi TabLineSel guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi Title guifg=#000099 guibg=NONE gui=bold cterm=bold
  hi VertSplit guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Visual guifg=NONE guibg=#ffffcc gui=NONE cterm=NONE
  hi VisualNOS guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi WildMenu guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi Comment guifg=#bbbbbb guibg=NONE gui=NONE cterm=NONE
  hi CodeListing guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi Constant guifg=#000099 guibg=NONE gui=bold cterm=bold
  hi Error guifg=NONE guibg=#ffcccc gui=NONE cterm=NONE
  hi Identifier guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Ignore guifg=#ff0088 guibg=#ffcccc gui=NONE cterm=NONE
  hi PreProc guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Special guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Statement guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Todo guifg=#cc0000 guibg=#ffcccc gui=italic cterm=italic
  hi Type guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorIM guifg=NONE guibg=fg gui=NONE cterm=NONE
  hi ToolbarLine guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
  hi ToolbarButton guifg=#ff0088 guibg=#ccffff gui=bold cterm=bold
  hi helpOption guifg=#004488 guibg=NONE gui=underline cterm=underline
  hi helpHyperTextJump guifg=#004488 guibg=NONE gui=bold,underline cterm=bold,underline
  hi helpHyperTextEntry guifg=#004488 guibg=NONE gui=bold cterm=bold
  hi helpCommand guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi LspDiagnosticsDefaultError guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  hi LspDiagnosticsDefaultHint guifg=#ff0088 guibg=#ccffff gui=NONE cterm=NONE
  hi LspDiagnosticsDefaultInformation guifg=#00aa00 guibg=NONE gui=NONE cterm=NONE
  hi LspDiagnosticsDefaultWarning guifg=#ee9900 guibg=NONE gui=NONE cterm=NONE
  hi WhichKeySeperator guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE
  hi WhichKeyGroup guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi WhichKey guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WhichKeyDesc guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi StatusLine guifg=#000000 guibg=#bbbbbb gui=NONE cterm=NONE
  hi StatusLineNC guifg=#bbbbbb guibg=#eeeeee gui=NONE cterm=NONE
  hi TabLine guifg=#bbbbbb guibg=#eeeeee gui=NONE cterm=NONE
  hi TabLineSel guifg=#000000 guibg=#bbbbbb gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  if !s:italics
    hi Folded gui=NONE cterm=NONE
    hi Todo gui=NONE cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 256
  if get(g:, 'mono_transp_bg', 0)
    hi Normal ctermfg=16 ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=16 ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=16 ctermbg=231 cterm=NONE
    hi Terminal ctermfg=16 ctermbg=231 cterm=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=255 cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=255 cterm=NONE
  hi CursorLineNr ctermfg=NONE ctermbg=255 cterm=bold
  hi DiffAdd ctermfg=NONE ctermbg=194 cterm=NONE
  hi DiffChange ctermfg=NONE ctermbg=223 cterm=NONE
  hi DiffDelete ctermfg=NONE ctermbg=224 cterm=NONE
  hi DiffText ctermfg=NONE ctermbg=195 cterm=bold,reverse
  hi Directory ctermfg=25 ctermbg=NONE cterm=bold,underline
  hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg ctermfg=160 ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=172 ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=198 ctermbg=195 cterm=NONE
  hi Folded ctermfg=250 ctermbg=NONE cterm=italic
  hi LineNr ctermfg=250 ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=189 cterm=NONE
  hi ModeMsg ctermfg=250 ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=198 ctermbg=230 cterm=NONE
  hi NonText ctermfg=250 ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=NONE ctermbg=255 cterm=NONE
  hi PmenuSbar ctermfg=198 ctermbg=195 cterm=NONE
  hi PmenuSel ctermfg=198 ctermbg=195 cterm=reverse
  hi PmenuThumb ctermfg=198 ctermbg=195 cterm=NONE
  hi Question ctermfg=198 ctermbg=195 cterm=NONE
  hi Search ctermfg=NONE ctermbg=189 cterm=NONE
  hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=198 ctermbg=195 cterm=NONE
  hi SpellBad ctermfg=NONE ctermbg=224 cterm=NONE
  hi SpellCap ctermfg=NONE ctermbg=230 cterm=NONE
  hi SpellLocal ctermfg=NONE ctermbg=225 cterm=NONE
  hi SpellRare ctermfg=NONE ctermbg=195 cterm=NONE
  hi StatusLine ctermfg=198 ctermbg=195 cterm=NONE
  hi StatusLineNC ctermfg=198 ctermbg=195 cterm=NONE
  hi TabLine ctermfg=198 ctermbg=195 cterm=NONE
  hi TabLineFill ctermfg=198 ctermbg=195 cterm=NONE
  hi TabLineSel ctermfg=198 ctermbg=195 cterm=NONE
  hi Title ctermfg=18 ctermbg=NONE cterm=bold
  hi VertSplit ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Visual ctermfg=NONE ctermbg=230 cterm=NONE
  hi VisualNOS ctermfg=198 ctermbg=195 cterm=NONE
  hi WildMenu ctermfg=198 ctermbg=195 cterm=NONE
  hi Comment ctermfg=250 ctermbg=NONE cterm=NONE
  hi CodeListing ctermfg=NONE ctermbg=255 cterm=NONE
  hi Constant ctermfg=18 ctermbg=NONE cterm=bold
  hi Error ctermfg=NONE ctermbg=224 cterm=NONE
  hi Identifier ctermfg=NONE ctermbg=NONE cterm=bold
  hi Ignore ctermfg=198 ctermbg=224 cterm=NONE
  hi PreProc ctermfg=NONE ctermbg=NONE cterm=bold
  hi Special ctermfg=NONE ctermbg=NONE cterm=bold
  hi Statement ctermfg=NONE ctermbg=NONE cterm=bold
  hi Todo ctermfg=160 ctermbg=224 cterm=italic
  hi Type ctermfg=NONE ctermbg=NONE cterm=underline
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=231 cterm=NONE
  hi ToolbarButton ctermfg=198 ctermbg=195 cterm=bold
  hi helpOption ctermfg=25 ctermbg=NONE cterm=underline
  hi helpHyperTextJump ctermfg=25 ctermbg=NONE cterm=bold,underline
  hi helpHyperTextEntry ctermfg=25 ctermbg=NONE cterm=bold
  hi helpCommand ctermfg=NONE ctermbg=255 cterm=NONE
  hi LspDiagnosticsDefaultError ctermfg=160 ctermbg=NONE cterm=NONE
  hi LspDiagnosticsDefaultHint ctermfg=198 ctermbg=195 cterm=NONE
  hi LspDiagnosticsDefaultInformation ctermfg=34 ctermbg=NONE cterm=NONE
  hi LspDiagnosticsDefaultWarning ctermfg=172 ctermbg=NONE cterm=NONE
  hi WhichKeySeperator ctermfg=160 ctermbg=NONE cterm=NONE
  hi WhichKeyGroup ctermfg=NONE ctermbg=NONE cterm=bold
  hi WhichKey ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WhichKeyDesc ctermfg=NONE ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=16 ctermbg=250 cterm=NONE
  hi StatusLineNC ctermfg=250 ctermbg=255 cterm=NONE
  hi TabLine ctermfg=250 ctermbg=255 cterm=NONE
  hi TabLineSel ctermfg=16 ctermbg=250 cterm=NONE
  hi TabLineFill ctermfg=NONE ctermbg=255 cterm=NONE
  if !s:italics
    hi Folded cterm=NONE
    hi Todo cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 8
  if get(g:, 'mono_transp_bg', 0)
    hi Normal ctermfg=Black ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=Black ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=Black ctermbg=White cterm=NONE
    hi Terminal ctermfg=Black ctermbg=White cterm=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi CursorLineNr ctermfg=NONE ctermbg=LightGrey cterm=bold
  hi DiffAdd ctermfg=NONE ctermbg=LightGreen cterm=NONE
  hi DiffChange ctermfg=NONE ctermbg=LightYellow cterm=NONE
  hi DiffDelete ctermfg=NONE ctermbg=LightRed cterm=NONE
  hi DiffText ctermfg=NONE ctermbg=LightCyan cterm=bold,reverse
  hi Directory ctermfg=DarkCyan ctermbg=NONE cterm=bold,underline
  hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi Folded ctermfg=DarkGrey ctermbg=NONE cterm=italic
  hi LineNr ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=LightBlue cterm=NONE
  hi ModeMsg ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=Magenta ctermbg=LightYellow cterm=NONE
  hi NonText ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi PmenuSbar ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi PmenuSel ctermfg=Magenta ctermbg=LightCyan cterm=reverse
  hi PmenuThumb ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi Question ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi Search ctermfg=NONE ctermbg=LightBlue cterm=NONE
  hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi SpellBad ctermfg=NONE ctermbg=LightRed cterm=NONE
  hi SpellCap ctermfg=NONE ctermbg=LightYellow cterm=NONE
  hi SpellLocal ctermfg=NONE ctermbg=LightMagenta cterm=NONE
  hi SpellRare ctermfg=NONE ctermbg=LightCyan cterm=NONE
  hi StatusLine ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi StatusLineNC ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi TabLine ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi TabLineFill ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi TabLineSel ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi Title ctermfg=DarkBlue ctermbg=NONE cterm=bold
  hi VertSplit ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Visual ctermfg=NONE ctermbg=LightYellow cterm=NONE
  hi VisualNOS ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi WildMenu ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi Comment ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi CodeListing ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi Constant ctermfg=DarkBlue ctermbg=NONE cterm=bold
  hi Error ctermfg=NONE ctermbg=LightRed cterm=NONE
  hi Identifier ctermfg=NONE ctermbg=NONE cterm=bold
  hi Ignore ctermfg=Magenta ctermbg=LightRed cterm=NONE
  hi PreProc ctermfg=NONE ctermbg=NONE cterm=bold
  hi Special ctermfg=NONE ctermbg=NONE cterm=bold
  hi Statement ctermfg=NONE ctermbg=NONE cterm=bold
  hi Todo ctermfg=DarkRed ctermbg=LightRed cterm=italic
  hi Type ctermfg=NONE ctermbg=NONE cterm=underline
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=White cterm=NONE
  hi ToolbarButton ctermfg=Magenta ctermbg=LightCyan cterm=bold
  hi helpOption ctermfg=DarkCyan ctermbg=NONE cterm=underline
  hi helpHyperTextJump ctermfg=DarkCyan ctermbg=NONE cterm=bold,underline
  hi helpHyperTextEntry ctermfg=DarkCyan ctermbg=NONE cterm=bold
  hi helpCommand ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi LspDiagnosticsDefaultError ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi LspDiagnosticsDefaultHint ctermfg=Magenta ctermbg=LightCyan cterm=NONE
  hi LspDiagnosticsDefaultInformation ctermfg=DarkGreen ctermbg=NONE cterm=NONE
  hi LspDiagnosticsDefaultWarning ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi WhichKeySeperator ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi WhichKeyGroup ctermfg=NONE ctermbg=NONE cterm=bold
  hi WhichKey ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WhichKeyDesc ctermfg=NONE ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=Black ctermbg=DarkGrey cterm=NONE
  hi StatusLineNC ctermfg=DarkGrey ctermbg=LightGrey cterm=NONE
  hi TabLine ctermfg=DarkGrey ctermbg=LightGrey cterm=NONE
  hi TabLineSel ctermfg=Black ctermbg=DarkGrey cterm=NONE
  hi TabLineFill ctermfg=NONE ctermbg=LightGrey cterm=NONE
  if !s:italics
    hi Folded cterm=NONE
    hi Todo cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 2
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=NONE
  hi CursorColumn term=reverse
  hi CursorLine term=underline
  hi CursorLineNr term=bold,italic,reverse,underline
  hi DiffAdd term=reverse,underline
  hi DiffChange term=reverse,underline
  hi DiffDelete term=reverse,underline
  hi DiffText term=bold,reverse,underline
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,italic,reverse
  hi FoldColumn term=reverse
  hi Folded term=italic,reverse,underline
  hi IncSearch term=bold,italic,reverse
  hi LineNr term=reverse
  hi MatchParen term=bold,underline
  hi ModeMsg term=NONE
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=NONE
  hi PmenuSel term=NONE
  hi PmenuThumb term=NONE
  hi PopupSelected term=reverse
  hi Question term=standout
  hi Search term=italic,underline
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=italic,underline
  hi SpellCap term=italic,underline
  hi SpellLocal term=italic,underline
  hi SpellRare term=italic,underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=reverse
  hi TabLine term=italic,reverse,underline
  hi TabLineFill term=reverse,underline
  hi TabLineSel term=bold
  hi Title term=bold
  hi VertSplit term=reverse
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi Comment term=italic
  hi Constant term=bold,italic
  hi Error term=reverse
  hi Identifier term=italic
  hi Ignore term=NONE
  hi PreProc term=italic
  hi Special term=bold,italic
  hi Statement term=bold
  hi Todo term=bold,underline
  hi Type term=bold
  hi Underlined term=underline
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  if !s:italics
    hi CursorLineNr term=bold,reverse,underline
    hi ErrorMsg term=bold,reverse
    hi Folded term=reverse,underline
    hi IncSearch term=bold,reverse
    hi Search term=underline
    hi SpellBad term=underline
    hi SpellCap term=underline
    hi SpellLocal term=underline
    hi SpellRare term=underline
    hi TabLine term=reverse,underline
    hi Comment term=NONE
    hi Constant term=bold
    hi Identifier term=NONE
    hi PreProc term=NONE
    hi Special term=bold
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: light
" Color: black         #000000                   ~         Black
" Color: red           #cc0000                   ~         DarkRed
" Color: green         #00aa00                   ~         DarkGreen
" Color: orange        #ee9900                   ~         DarkYellow
" Color: yellow        #ffff00                   ~         DarkYellow
" Color: blue          #0000ff                   ~         DarkBlue
" Color: darkblue      #000099                   ~         DarkBlue
" Color: magenta       #ff00ff                   ~         DarkMagenta
" Color: cyan          #00ffff                   ~         DarkCyan
" Color: white         #eeeeee                   ~         LightGrey
" Color: brightblack   #bbbbbb                   ~         DarkGrey
" Color: brightred     #ffcccc                   ~         LightRed
" Color: brightgreen   #ccffcc                   ~         LightGreen
" Color: brightyellow  #ffffcc                   ~         LightYellow
" Color: brightorange  #ffe5cc                   ~         LightYellow
" Color: brightblue    #ccccff                   ~         LightBlue
" Color: brightmagenta #ffccff                   ~         LightMagenta
" Color: brightcyan    #ccffff                   ~         LightCyan
" Color: brightwhite   #ffffff                  231        White
" Color: undefined     #ff0088                   ~         Magenta
" Color: special       #004488                   ~         DarkCyan
" Term colors: black red green yellow blue magenta cyan white
" Term colors: brightblack brightred brightgreen brightyellow
" Term colors: brightblue brightmagenta brightcyan brightwhite
" vim: et ts=2 sw=2