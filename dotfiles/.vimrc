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
set splitright "open splits to the right.
set splitbelow "open splits below.
set backspace=indent,eol,start "sets backspace to work like normal

if has("wildmenu")
	set wildignore+=*.a,*.o,*.aux,*.brf,*.out
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
		"colorscheme slate
		:set guioptions-=m  "remove menu bar
		:set guioptions-=T  "remove toolbar
		:set guioptions-=r  "remove right-hand scroll bar
		:set guioptions-=L  "remove left-hand scroll bar
	endif
	colorscheme zellner
	set background=light
	nmap <silent> <A-k> :wincmd k<CR>
	nmap <silent> <A-j> :wincmd j<CR>
	nmap <silent> <A-h> :wincmd h<CR>
	nmap <silent> <A-l> :wincmd l<CR>
	set noswapfile
else
	"moves the dir for swap files to ~/.swp
	"having trailing // forces file names to be unique
	"This is so I don't litter gdrive and dboxx with .swp files anymore
	set directory=$HOME/.temp/swp//
	"set backupdir=$HOME/.temp/bak//
	set undodir=$HOME/.temp/und//
	set undofile
	set viminfo+=n~/.temp
	colorscheme nucolors
	let g:tmux_navigator_no_mappings = 1

	nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
	nnoremap <silent> <C-a><C-j> :TmuxNavigateDown<cr>
	nnoremap <silent> <C-a><C-k> :TmuxNavigateUp<cr>
	nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
	set background=dark
endif


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

"control mappings
"sets intuitive word wrapped line movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

cnoremap jj <C-f>
inoremap jj <ESC>

nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

"remove annoying keys
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

let mapleader=" "
"clears the highlight from the search
nmap <silent> <leader><space> :nohlsearch <CR>

"break a line at the cursor
nmap <silent> <leader><CR> i<CR><ESC>

"insert a line without leaving insert mode
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

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

"conversion mappings
command Edos e ++ff=dos
command Enix e ++ff=dos<CR> :setlocal ff=unix<CR>

"jumps to end of line in command mode
nmap <leader>l $
"jumps to beginning of line in command mode
nmap <leader>h __

"clears all trailing whitespaces
nmap <leader>$ :%s/\s\+$// <CR>

"command line shortcuts
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>s :%s

nnoremap <leader>b  :b

"map leader v to ctrl v
nmap <leader>v <C-v>

"map leader i = ctrl a (increment)
nmap <leader>i <C-a>

"map leader d = ctrl x (decrement)
nmap <leader>d <C-x>

"maps for make/make error
nmap <leader>m :w<CR>:make<CR>
nmap <leader>n :cn<CR>
nmap <leader>N :cp<CR>

autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber | set number

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>cw :call MarkWindowSwap()<CR>
nmap <silent> <leader>cp :call DoWindowSwap()<CR>

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
nmap <leader># :call NumberToggle() <cr>

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

"Latex bindings
"set auto spellcheck on latex files only
autocmd BufNewFile,BufRead *.tex set spell
let g:tex_flavor = "latex"
"set no spell checking in latex comments.
let g:tex_comment_nospell = 1
let g:atp_map_backward_motion_leader = ","
let g:atp_map_forward_motion_leader = ","
