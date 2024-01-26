" tmblack.vim
"
"
" http://vimdoc.sourceforge.net/htmldoc/syntax.html
"
" *cterm-colors*
" NR-16   NR-8    COLOR NAME 
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "tmblack"

" General colors
hi Cursor       guifg=NONE  guibg=#999999 gui=none
hi CursorLine   cterm=NONE  ctermbg=233 guibg=#202020
hi CursorLineNr term=bold cterm=bold ctermfg=11 gui=bold guifg=Yellow
hi Normal       ctermfg=230 guifg=#f6f3e8 guibg=#111111 gui=none
hi NonText      ctermfg=244 guifg=#808080 guibg=#171717 gui=none
hi LineNr       ctermfg=244 ctermbg=16 guifg=#808080 guibg=#000000 gui=none
hi StatusLine   ctermfg=230 guifg=#f6f3e8 guibg=#737897 gui=italic
hi StatusLineNC ctermbg=236 guifg=#857b6f guibg=#444444 gui=none
hi VertSplit    ctermfg=236 ctermbg=236 guifg=#444444 guibg=#444444 gui=none
hi Folded       ctermbg=100 guibg=#384048 guifg=#a0a8b0 gui=none
hi Title        ctermfg=230 guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual       ctermfg=230 ctermbg=236 guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey   ctermfg=244 guifg=#808080 guibg=#343434 gui=none
hi IncSearch    cterm=underline gui=underline
hi Search       ctermfg=230 ctermbg=236 guifg=#f6f3e8 guibg=#444444 gui=none

" Syntax highlighting
hi Comment      ctermfg=244 guifg=#99968b gui=italic
hi Todo         guifg=#8f8f8f gui=italic
hi Constant     ctermfg=216 guifg=#e5786d gui=none
hi String       ctermfg=118 guifg=#95e454 gui=italic
hi Identifier   ctermfg=188 guifg=#cae682 gui=none
hi Function     ctermfg=195 guifg=#cae682 gui=none
hi Type         ctermfg=157 guifg=#cae682 gui=none
hi Statement    ctermfg=45 guifg=#8ac6f2 gui=none
hi Keyword      ctermfg=117 guifg=#8ac6f2 gui=none
hi PreProc      ctermfg=229 guifg=#e5786d gui=none
hi Number       ctermfg=196 guifg=#e5786d gui=none
hi Special      ctermfg=151 guifg=#e7f6da gui=none
hi ColorColumn  ctermbg=232 guibg=#161616 gui=none

" Spelling
if has("spell")
    "hi SpellBad      term=reverse    ctermfg=Black   ctermbg=Red     gui=undercurl guisp=Red
    "hi SpellLocal    term=underline  ctermfg=Black   ctermbg=Cyan    gui=undercurl guisp=Cyan
    "hi SpellRare     term=reverse    ctermfg=Black   ctermbg=Magenta gui=undercurl guisp=Magenta
    "hi SpellCap      term=reverse    ctermfg=White   ctermbg=Blue    gui=undercurl guisp=Blue

    hi clear SpellBad
    hi SpellBad term=standout ctermfg=9 ctermbg=0 term=underline cterm=underline
    hi clear SpellCap
    hi SpellCap term=standout ctermfg=6 term=underline cterm=underline
    hi clear SpellRare
    hi SpellRare term=underline cterm=underline
    hi clear SpellLocal
    hi SpellLocal term=underline cterm=underline
endif

if has("spell")
    hi SpellBad                    guisp=#F07070               gui=undercurl
    hi SpellCap                    guisp=#7070F0               gui=undercurl
    hi SpellLocal                  guisp=#70F0F0               gui=undercurl
    hi SpellRare                   guisp=#F070F0               gui=undercurl
endif

" pmenu
hi PMenu      ctermfg=188  ctermbg=236
hi PMenuSel   ctermfg=235  ctermbg=45

"highlight   Pmenu         ctermfg=0 ctermbg=2
"highlight   PmenuSel      ctermfg=0 ctermbg=7
highlight   PmenuSbar     ctermfg=7 ctermbg=0
highlight   PmenuThumb    ctermfg=0 ctermbg=7

hi IndentGuidesOdd  ctermbg=233 guibg=#000000
hi IndentGuidesEven ctermbg=232 guibg=#161616

