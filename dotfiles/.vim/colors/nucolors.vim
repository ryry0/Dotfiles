" Vim color scheme
"
" Name:        dotshare.vim
" Maintainer:  Christian Brassat <crshd@mail.com>
" License:     public domain
"

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
	let g:colors_name = "nucolors"

  	" General Colors
  	let NormalFG      = '#BBBBBB'
  	let NormalBG      = '#151515'

  	let DarkGray      = '#101010'
  	let LightGray     = '#404040'

  	let DarkRed       = '#E84F4F'
  	let LightRed      = '#D23D3D'

  	let DarkGreen     = '#B8D68F'
  	let LightGreen    = '#A0CF5D'

  	let DarkYellow    = '#E1AA5D'
  	let LightYellow   = '#F39D21'

  	let DarkBlue      = '#7DC1CF'
  	let LightBlue     = '#4E9FB1'

  	let DarkMagenta   = '#9B64FB'
  	let LightMagenta  = '#8542FF'

  	let DarkCyan      = '#6D878D'
  	let LightCyan     = '#42717B'

  	let White         = '#FFFFFF'

  	" Specific Colors
  	let CursorColor   = '#FF8939'
  	let CursorLColor  = '#202020'

  	let LineNrFG      = '#665544'
  	let LineNrBG      = '#101010'

  	let FoldFG        = DarkCyan
  	let FoldBG        = '#101010'

  	let SplitFG       = '#1B1B1B'
  	let SplitBG       = SplitFG

  	let StatusBG      = DarkGray

  	" GUI - bold/italic/underline/none 
  	let GUI           = 'bold'

  	"hi Nontext ctermfg=LightGray
  	"hi Normal                    ctermfg=NormalFG      ctermbg='.NormalBG
  	"hi Cursor                                            ctermbg=CursorColor
  	"hi CursorLine                                        ctermbg=CursorLColor
  	hi LineNr	ctermfg=darkcyan ctermbg=black
  	hi Search                     ctermbg=DarkBlue
  	"hi VertSplit                 ctermfg=SplitFG.      ctermbg=SplitBG
	hi Visual                     ctermfg=black         ctermbg=DarkBlue
  	"hi Folded                    ctermfg=FoldFG.       ctermbg='.FoldBG
  	"hi FoldColumn                ctermfg=FoldFG.   		ctermbg='.FoldBG
  	"hi Directory                 ctermfg=LightGreen
  	"hi Pmenu                     ctermfg=NormalFG     ctermbg='.LightGray
  	"hi PmenuSel                  ctermfg=DarkGray		ctermbg=LightGreen
  	"hi PMenuSbar                                         	ctermbg=DarkCyan
  	"hi PMenuThumb                                        	ctermbg=DarkGreen
  	"hi Comment                   ctermfg=LightGray
  	"hi Todo                      ctermfg=LightGray		ctermbg=NONE
  	hi NonText                   ctermfg=DarkCyan
  	hi SpecialKey                ctermfg=DarkCyan
  	hi Constant                  ctermfg=DarkBlue
  	hi Define                    ctermfg=DarkYellow
  	hi Delimiter                 ctermfg=DarkMagenta
  	hi Error                     ctermfg=DarkGray		ctermbg=DarkRed
  	hi Function                  ctermfg=DarkRed		
  	"hi Identifier                ctermfg=LightYellow
  	hi Include                   ctermfg=DarkYellow		
  	hi Keyword                   ctermfg=DarkMagenta
  	hi Macro                     ctermfg=DarkMagenta
  	hi Number                    ctermfg=LightGreen
  	"hi PreCondit                 ctermfg=DarkMagenta	
  	hi PreProc                   ctermfg=DarkYellow
  	"hi Statement                 ctermfg=LightBlue		
  	"hi String                    ctermfg=White
  	hi Title                     ctermfg=LightGray
  	hi Type                      ctermfg=DarkRed		
  	hi DiffAdd                   ctermfg=DarkGray		ctermbg=LightGreen
  	hi DiffDelete                ctermfg=DarkGray		ctermbg=LightRed
  	hi Search		     ctermfg=Black		ctermbg=DarkCyan
  	hi MatchParen		     cterm=bold                 ctermfg=LightGreen		ctermbg=DarkGray

  	"hi link htmlTag              xmlTag
  	"hi link htmlTagName          xmlTagName
  	"hi link htmlEndTag           xmlEndTag

  	"exe 'hi xmlTag                    ctermfg='.LightMagenta
  	"exe 'hi xmlTagName                ctermfg='.LightMagenta
  	"exe 'hi xmlEndTag                 ctermfg='.LightMagenta

  	"" Status line - changes colors depending on insert mode
  	"" Standard
  	"exe 'hi User1                     ctermfg='.DarkYellow.'  ctermbg='.StatusBG.'      gui='.GUI
  	"exe 'hi User2                     ctermfg='.DarkRed.'     ctermbg='.StatusBG.'      gui='.GUI
  	"exe 'hi User3                     ctermfg='.LightGreen.'  ctermbg='.StatusBG.'      gui='.GUI
  	"exe 'hi User4                     ctermfg='.DarkGray.'    ctermbg='.DarkMagenta.'   gui='.GUI
  	"exe 'hi User5                     ctermfg='.NormalFG.'    ctermbg='.StatusBG
  	"exe 'hi User6                     ctermfg='.LightGray.'   ctermbg='.StatusBG
  	"exe 'hi User7                     ctermfg='.StatusBG.'    ctermbg='.StatusBG.'      gui='.GUI
  	"exe 'hi StatusLine                ctermfg='.NormalFG.'    ctermbg='.StatusBG.'      gui='.GUI
  	"exe 'hi StatusLineNC              ctermfg='.LightGray.'   ctermbg='.StatusBG.'      gui='.GUI

  	"function! InsertStatuslineColor(mode)
	"	let DarkGray      = '#101010'
	"	let DarkRed       = '#E84F4F'
        "	let DarkBlue      = '#7DC1CF'
	"	let DarkMagenta   = '#9B64FB'

	"	if a:mode == 'i' " Insert Mode
	"		exe 'hi User4                 ctermfg='.DarkGray.'    ctermbg='.DarkBlue
	"	
	"	elseif a:mode == 'r' " Replace Mode
	"		exe 'hi User4                 ctermfg='.DarkGray.'    ctermbg='.DarkRed
	"	
	"	else
	"		exe 'hi User4                 ctermfg='.DarkGray.'    ctermbg='.DarkMagenta
	"	
	"	endif
	"endfunction

" Call function
"exe 'au InsertEnter * call InsertStatuslineColor(v:insertmode)'
"exe 'au InsertLeave * hi statusline ctermfg='.NormalFG.' ctermbg='.StatusBG
"exe 'au InsertLeave * hi User4      ctermfg='.DarkGray.' ctermbg='.DarkMagenta
