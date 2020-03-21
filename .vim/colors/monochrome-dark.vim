set background=dark
highlight clear
if exists("syntax-on")
  syntax reset
endif
let g:colors_name = "monochrome-dark"

" vim
highlight Search        cterm=NONE          ctermbg=235         ctermfg=230
highlight Visual        cterm=NONE          ctermbg=235         ctermfg=230
highlight LineNr        cterm=NONE          ctermbg=NONE        ctermfg=NONE
highlight CursorLineNr  cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight CursorLine    cterm=NONE          ctermbg=235         ctermfg=NONE 
highlight ColorColumn   cterm=NONE          ctermbg=16          ctermfg=NONE
highlight Folded        cterm=italic        ctermbg=NONE        ctermfg=NONE

" vimscript
highlight link vimVar Var
highlight link vimEnvvar vimVar
highlight link vimFuncName Func
highlight link vimFunc vimFuncName

" code 
highlight Normal        cterm=NONE          ctermbg=NONE        ctermfg=NONE
highlight Type          cterm=underline     ctermbg=NONE        ctermfg=NONE
highlight Statement     cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight Conditional   cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight Comment       cterm=italic        ctermbg=NONE        ctermfg=242
highlight Todo          cterm=italic        ctermbg=NONE        ctermfg=242
highlight Number        cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight String        cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight Character     cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight Special       cterm=italic        ctermbg=NONE        ctermfg=NONE 
highlight ConId         cterm=underline     ctermbg=NONE        ctermfg=NONE
highlight Constant      cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight Delimiter     cterm=NONE          ctermbg=NONE        ctermfg=NONE

" C / C++ specific
highlight cInclude      cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight cIncluded     cterm=NONE          ctermbg=NONE        ctermfg=NONE
highlight cPreCondit    cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight cDefine       cterm=bold          ctermbg=NONE        ctermfg=NONE

" Haskell specific
highlight hsImport      cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight hsStructure   cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight hsModule      cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight hsVarSym      cterm=NONE          ctermbg=NONE        ctermfg=NONE 

" Java specific 
highlight javaExternal    cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight javaScopeDecl   cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight javaClassDecl   cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight javaAnnotation  cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight link javaDocComment   Comment 
highlight link javaFold         Comment 
highlight link javaDocTags      Comment 
highlight link javaCommentTitle Comment 
highlight link javaDocParam     Comment 

" Markdown specific
highlight markdownH1      cterm=bold,underline ctermbg=NONE        ctermfg=NONE
highlight link markdownHeadingDelimiter markdownH1 
highlight link markdownH2 markdownH1 
highlight link markdownH3 markdownH1 
highlight link markdownH4 markdownH1 
highlight link markdownCode Comment
highlight link markdownCodeBlock markdownCode 

" Vimscript specific
highlight vimOption cterm=underline ctermbg=NONE ctermfg=NONE
highlight link vimContinue Normal
highlight link vimLineComment Comment
highlight link vimCommentTitle Comment

" LaTeX specific
highlight link texDocZone Normal
highlight link texSection Statement

" Manpages
highlight link manSubHeading manSectionHeading
highlight link manReference Normal

" Diff
highlight DiffAdd    cterm=NONE ctermbg=22   ctermfg=NONE
highlight DiffDelete cterm=NONE ctermbg=88   ctermfg=NONE
highlight DiffChange cterm=NONE ctermbg=238  ctermfg=NONE
highlight DiffText   cterm=bold ctermbg=NONE ctermfg=NONE
