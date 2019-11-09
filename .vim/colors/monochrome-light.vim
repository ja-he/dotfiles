set background=light
highlight clear
if exists("syntax-on")
  syntax reset
endif
let g:colors_name = "monochrome-light"

" 231 = slight emphasis 
" 230 = background 
"  16 = foreground 

" vim
highlight Search        cterm=NONE          ctermbg=230         ctermfg=NONE
highlight Visual        cterm=NONE          ctermbg=230         ctermfg=16
highlight LineNr        cterm=NONE          ctermbg=NONE        ctermfg=NONE
highlight CursorLineNr  cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight CursorLine    cterm=NONE          ctermbg=255         ctermfg=NONE 
highlight ColorColumn   cterm=NONE          ctermbg=231         ctermfg=196
highlight Folded        cterm=italic        ctermbg=NONE        ctermfg=NONE
highlight StatusLine    cterm=italic        ctermbg=231         ctermfg=grey

" code 
highlight Normal        cterm=NONE          ctermbg=NONE        ctermfg=NONE
highlight Type          cterm=underline     ctermbg=NONE        ctermfg=NONE
highlight Statement     cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight Conditional   cterm=bold          ctermbg=NONE        ctermfg=NONE 
highlight Comment       cterm=italic        ctermbg=NONE        ctermfg=grey
highlight Todo          cterm=italic        ctermbg=NONE        ctermfg=grey
highlight Number        cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight String        cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight Character     cterm=NONE          ctermbg=NONE        ctermfg=NONE 
highlight Special       cterm=italic        ctermbg=NONE        ctermfg=NONE 
highlight ConId         cterm=underline     ctermbg=NONE        ctermfg=NONE
highlight Constant      cterm=bold          ctermbg=NONE        ctermfg=NONE
highlight Delimiter     cterm=NONE          ctermbg=NONE        ctermfg=NONE
highlight Error         cterm=NONE          ctermbg=181         ctermfg=NONE

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
highlight markdownCode cterm=italic ctermbg=NONE ctermfg=250  
highlight link markdownCodeBlock markdownCode 

" Vimscript specific
highlight vimOption cterm=underline ctermbg=NONE ctermfg=NONE
highlight link vimContinue Normal
highlight link vimLineComment Comment
highlight link vimCommentTitle Comment

" LaTeX specific
highlight link texDocZone Normal
highlight link texSection Statement

" Presentation Settings 
set mouse=a
set norelativenumber
