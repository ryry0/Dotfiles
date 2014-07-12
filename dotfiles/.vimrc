syntax on
set ignorecase
set smartcase
"set gdefault don't want this because it's nonstandard.
set incsearch
set showmatch
set hlsearch

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set nobackup
"moves the dir for swap files to ~/.swp 
"having trailing // forces file names to be unique
"This is so I don't litter gdrive and dboxx with .swp files anymore
set directory=$HOME/.temp/swp//
"set backupdir=$HOME/.temp/bak//
set undodir=$HOME/.temp/und//
set undofile

set relativenumber | set number
set nocompatible
set hidden
set cursorline
"set cursorcolumn

"use z= to use spellcheck
set spelllang=en

"set auto spellcheck on latex files only
autocmd BufNewFile,BufRead *.tex set spell

"checks for trailing whitespace

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
vnoremap j gj
vnoremap k gk


"sets the colon to enter vim command edit insert mode default
nnoremap ; :

"nnoremap : ;
nnoremap , ;

"do the same thing in visual mode
vnoremap ; :
"vnoremap : ;
cnoremap jj <C-f>

" Also, this installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
":helptags ~/.vim/doc

let mapleader=" "
"clears the highlight from the search
nmap <silent> <leader><space> ;nohlsearch <CR>

"break a line at the cursor
nmap <silent> <leader><CR> i<CR><ESC>

"insert a line without leaving insert mode
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

inoremap jj <ESC>
"ctags and ctags navigation
nnoremap <f12> :!ctags -R <cr>
nnoremap <leader>] <C-]>
nnoremap <leader>t <C-t>

"maps leader r to redo
nnoremap <leader>r <C-r>

noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p

"allows you to open command line history using q;
nnoremap q; q:
noremap <leader>q q:
noremap <leader>; q:

"opens previous buffered file.
nmap <leader>e :e#<CR>

"jumps to end of line in command mode
nmap <leader>l $
"jumps to beginning of line in command mode
nmap <leader>h __

"clears all trailing whitespaces
nmap <leader>w :%s/\s\+$// <CR>

"scrolls up in my weird way
nmap <leader>j Lzz
nmap <leader>k Hzz

"map leader v to ctrl v
nmap <leader>v <C-v>

"map leader a = ctrl a
nmap <leader>a <C-a>

"map leader x = ctrl x
nmap <leader>x <C-x>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

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

"maps leader n to calling the number toggle.
nmap <leader>n :call NumberToggle() <cr>
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
set showcmd

"tab styling options
"set c file styling
"no spell check
"tabs are 2 spaces
"trailing whitespace is highlighted
"no indent of namespaces
autocmd FileType c,cpp set nospell | set expandtab | set softtabstop=2 
			\| set tabstop=2 | set shiftwidth=2 
			\| match ErrorMsg '\s\+$' | set cino=N-s 
			\| set formatoptions+=t | set textwidth=80 
