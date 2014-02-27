syntax on
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set showcmd

set nu
set nocompatible
set hidden
set cursorline
"set cursorcolumn

"use z= to use spellcheck
set spelllang=en

"tab styling options
"set c file styling
autocmd FileType c,cpp set nospell | set expandtab | set tabstop=2 | set shiftwidth=2

"set auto spellcheck on latex files only
autocmd BufNewFile,BufRead *.tex set spell


set formatoptions=l
set lbr

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set autoindent
set copyindent
set smartindent

"toggle paste mode to properly indent text when copying
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"

"sets intuitive word wrapped line movement
nnoremap j gj
nnoremap k gk
vnoremap k gk
vnoremap j g

"sets the colon to semicolon
nnoremap ; :
nnoremap : ;
" Also, this installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
":helptags ~/.vim/doc

"clears the highlight from the search
nmap <silent> <leader><space> ;nohlsearch <CR>

"break a line at the cursor
nmap <silent> <leader><CR> i<CR><ESC>

"insert a line without leaving insert mode
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

inoremap jj <ESC>
nnoremap <f12> :!ctags -R <cr>

noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p

autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber | set number

function! NumberToggle()
	if (&relativenumber ==1)
		set norelativenumber
		set number

	else
		set nonumber
		set relativenumber
		set number
	endif
endfunc

nnoremap <f5> :call NumberToggle() <cr>
set background=dark
colorscheme nucolors
" Statusline (c) Winterdom
" http://winterdom.com/2007/06/vimstatusline

set ls=2 " Always show status line
hi StatusLine ctermbg=black
hi StatusLine ctermfg=gray
if has('statusline')
	" Status line detail:
	" %f     file path
	" %y     file type between braces (if defined)
	" %([%R%M]%)   read-only, modified and modifiable flags between braces
	" %{'!'[&ff=='default_file_format']}
	"        shows a '!' if the file format is not the platform
	"        default
	" %{'$'[!&list]}  shows a '*' if in list mode
	" %{'~'[&pm=='']} shows a '~' if in patchmode
	" (%{synIDattr(synID(line('.'),col('.'),0),'name')})
	"        only for debug : display the current syntax item name
	" %=     right-align following items
	" #%n    buffer number
	" %l/%L,%c%V   line number, total number of lines, and column number
	function SetStatusLineStyle()
		if &stl == '' || &stl =~ 'synID'
			let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=buff:#%n line:%l/%L col:%c%V "
		else
			let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=buff:#%n line:%l/%L col%c%V "
		endif
	endfunc
	" Switch between the normal and vim-debug modes in the status line
	nmap _ds :call SetStatusLineStyle()<CR>
	call SetStatusLineStyle()
	" Window title
	if has('title')
		set titlestring=%t%(\ [%R%M]%)
	endif
endif
