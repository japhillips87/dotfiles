set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "JoshsAwesomeColors"

hi Cursor                         guifg=Black      guibg=Cyan
hi Normal      ctermfg=Cyan       guifg=White      guibg=#242424      ctermbg=DarkGrey
hi Visual                         guifg=White      guibg=Blue         gui=NONE

hi Comment     ctermfg=Green      guifg=Green   
hi Constant    ctermfg=Red        guifg=Red
hi Special     ctermfg=Green      guifg=Green   
hi Identifier  ctermfg=Cyan       guifg=Cyan
hi Statement   ctermfg=DarkRed    guifg=#FF6600                       gui=NONE
hi PreProc     ctermfg=Yellow     guifg=Yellow
hi Type        ctermfg=Red        guifg=Red                           gui=NONE
hi Ignore      ctermfg=DarkGrey   guifg=DarkGrey
hi LineNr      ctermfg=DarkGrey   guifg=DarkGrey

hi rubySymbol            ctermfg=Red        guifg=Red
hi rubyInstanceVariable  ctermfg=Cyan       guifg=Cyan
hi rubyClassVariable     ctermfg=Cyan       guifg=Cyan

hi FoldColumn                     guifg=#C4C0B0    guibg=#42403C
hi Folded                         guifg=#C4C0B0    guibg=#22201C

hi DiffAdd                                         guibg=DarkBlue     ctermbg=DarkBlue
hi DiffDelete                                      guibg=DarkCyan     ctermbg=DarkCyan  gui=NONE
hi DiffText                                        guibg=DarkRed      ctermbg=DarkRed   gui=NONE
hi DiffChange                                      guibg=DarkMagenta  ctermbg=DarkMagenta

if v:version >= 700

hi CursorLine                     guifg=Black      guibg=#00FF00
hi CursorColumn                   guifg=Black      guibg=#00FF00

hi MatchParen  ctermfg=White      guifg=White      guibg=DarkGreen    ctermbg=DarkGreen

hi Pmenu       ctermfg=Black      guifg=Black      guibg=#C4C090      ctermbg=LightGray
hi PmenuSel    ctermfg=Black      guifg=White      guibg=#0000FF      ctermbg=Green
hi PmenuSbar   ctermfg=Black      guifg=Black      guibg=LightGray    ctermbg=White
hi PmenuThumb  ctermfg=Black      guifg=Black      guibg=White        ctermbg=Green  gui=NONE  cterm=NONE

hi TabLine                        guifg=Black      guibg=LightGray    gui=NONE
hi TabLineFill                    guifg=Black      guibg=LightGray    gui=NONE
hi TabLineSel                     guifg=White      guibg=Black

hi treeDir guifg=Black guibg=#00FF00

endif

" vim: ts=2 sw=2
