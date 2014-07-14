syntax on
set ignorecase
set smartcase
"set gdefault don't want this because it's nonstandard.
set incsearch
set showmatch
set hlsearch
set nosol
set shm=at
set scrolloff=2

if has("wildmenu")
	set wildignore+=*.a,*.o
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
	set wildignore+=.DS_Store,.git,.hg,.svn
	set wildignore+=*~,*.swp,*.tmp
	set wildmenu
	set wildignorecase
	set wildmode=longest:full,full
endif

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set nobackup
if has("win32")
	if has("gui_running")
		set guifont=Consolas:h10:cANSI
		colorscheme slate
		:set guioptions-=m  "remove menu bar
		:set guioptions-=T  "remove toolbar
		:set guioptions-=r  "remove right-hand scroll bar
		:set guioptions-=L  "remove left-hand scroll bar
	endif
	set noswapfile
else
	"moves the dir for swap files to ~/.swp
	"having trailing // forces file names to be unique
	"This is so I don't litter gdrive and dboxx with .swp files anymore
	set directory=$HOME/.temp/swp//
	"set backupdir=$HOME/.temp/bak//
	set undodir=$HOME/.temp/und//
	set undofile
	colorscheme nucolors
endif

set background=dark

set relativenumber | set number
set nocompatible
set hidden
set cursorline
"set cursorcolumn

"use z= to use spellcheck
set spelllang=en_us

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

"control mappings
"sets intuitive word wrapped line movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

cnoremap jj <C-f>

let mapleader=" "
"clears the highlight from the search
nmap <silent> <leader><space> :nohlsearch <CR>

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
noremap <leader>; q:

"opens previous buffered file.
nmap <leader>e :e#<CR>

"jumps to end of line in command mode
nmap <leader>l $
"jumps to beginning of line in command mode
nmap <leader>h __

"clears all trailing whitespaces
nmap <leader>$ :%s/\s\+$// <CR>

nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

cnoremap <leader>q :q<CR>

nnoremap <leader>S :%s
nnoremap <leader>s :s
vnoremap <leader>s :s

"map leader v to ctrl v
nmap <leader>v <C-v>

"map leader a = ctrl a
nmap <leader>i <C-a>

"map leader x = ctrl x
nmap <leader>d <C-x>

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

"file styling options
"tab styling options
"set c file styling
"no spell check
"tabs are 2 spaces
"trailing whitespace is highlighted
"no indent of namespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd FileType c,cpp set nospell | set expandtab | set softtabstop=2
			\| set tabstop=2 | set shiftwidth=2
			\| match ExtraWhitespace '\s\+$' | set cino=N-s
			\| autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
			\| autocmd InsertLeave * match ExtraWhitespace /\s\+$/
			\| set formatoptions+=t | set textwidth=80

"set auto spellcheck on latex files only
autocmd BufNewFile,BufRead *.tex set spell
