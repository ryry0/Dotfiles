syntax on
set ignorecase
set smartcase
"set gdefault don't want this because it's nonstandard.
set incsearch
set showmatch
set hlsearch
set nosol "don't change cursor column when moving
set shm=at "shortens messages to minimum
set scrolloff=2 "leaves 2 lines at top and bottom of screen from cursor
set splitright "open splits to the right.
set splitbelow "open splits below.
set backspace=indent,eol,start "sets backspace to work like normal
set exrc "allows local configurations of .vimrc
"set secure "disables unsafe options in local .vimrc
"set title
set showcmd

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

function SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 5m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

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
	set viminfo+=n~/.temp/
	colorscheme nucolors
	let g:tmux_navigator_no_mappings = 1

	nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
	nnoremap <silent> <C-a><C-j> :TmuxNavigateDown<cr>
	nnoremap <silent> <C-a><C-k> :TmuxNavigateUp<cr>
	nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
	set background=dark
endif


set relativenumber | set number
"set number
set nocompatible
set hidden
set cursorline
"set cursorcolumn

"use z= to use spellcheck
set spelllang=en_us

set formatoptions=l
set lbr "don't break words in middle

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
vnoremap K <nop>

let mapleader=" "
"clears the highlight from the search
nmap <silent> <leader><space> :nohlsearch <CR>

"break a line at the cursor
nmap <silent> <leader><CR> i<CR><ESC>

"insert a line without leaving insert mode
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

"ctags and ctags navigation
nnoremap <f12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR>

nnoremap <leader>] <C-]>
nnoremap <leader>t <C-t>

vnoremap <leader>] <C-]>
vnoremap <leader>t <C-t>

noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p

vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
vnoremap <leader>p "+p

"allows you to open command line history using q;
nnoremap q; q:
noremap <leader>; q:

"opens previous buffered file.
nmap <leader>e :e#<CR>

"conversion mappings
command Edos e ++ff=dos
command Enix e ++ff=dos<CR> :setlocal ff=unix<CR>

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
nmap <leader>m :w<CR>:make!<CR>
nmap <leader>n :cn<CR>
nmap <leader>N :cp<CR>

"maps for indentation
nmap <leader>{ =i{
nmap <leader>= gg=G

"maps for change commands
nnoremap ci( %ci(
nnoremap di( %di(
nnoremap vi( %vi(

nnoremap ci{ %ci{
nnoremap di{ %di{
nnoremap vi{ %vi{

nnoremap ci[ %ci[
nnoremap di[ %di[
nnoremap vi[ %vi[

"late parenthesis mapping. Surrounds visually selected text in parens
vnoremap <leader>( <Esc>`>a)<Esc>`<i(<Esc>

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
nmap <leader># :call NumberToggle() <cr>

"file styling options
"tab styling options
"set c file styling
"no spell check
"tabs are 2 spaces
"trailing whitespace is highlighted
"no indent of namespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd FileType arduino,c,cpp set nospell | set expandtab | set softtabstop=2
			\| set tabstop=2 | set shiftwidth=2
			\| match ExtraWhitespace '\s\+$' | set cino=N-s
			\| autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
			\| autocmd InsertLeave * match ExtraWhitespace /\s\+$/
			\| set formatoptions+=t | set textwidth=80

"Latex bindings
"set auto spellcheck on latex files only
autocmd BufNewFile,BufRead *.tex set spell | set formatoptions+=t | set textwidth=80
let g:tex_flavor = "latex"
"set no spell checking in latex comments.
let g:tex_comment_nospell = 1

"helper to delete empty space character
"from Vim Manual
function! Eatchar()
	let c = nr2char(getchar())
	return (c=~ '\s')? '': c
endfunction

"replace abbrev if we're not in content or unwanted place
"from Luc Hermitte
function! MapNoContext(key,seq)
	let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
	if syn =~? 'comment\|string\|character\|doxygen'
		return a:key
	else
		exe'return "' .
		\ substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) . '"'
	endif
endfunction

"create abbrev suitable for mapnocontext
"from Vladimir Marek
function! Iab (ab, full)
	exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('"
	\ a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
	\"')<CR>"
endfunction

"C abbreviations :
call Iab('incl', '#include <><Left>')
call Iab('defi', '#define ')
call Iab('fori', 'for (int i = 0; i <; ++i) {<CR><CR>}<UP><UP><ESC>0f<a ')
call Iab('foru', 'for (unsigned int i = 0; i <; ++i) {<CR><CR>}<UP><UP><ESC>0f<a ')
call Iab('fors', 'for (size_t i = 0; i <; ++i) {<CR><CR>}<UP><UP><ESC>0f<a ')
call Iab('forb', 'for (;;) {<CR><CR>}<UP><UP><ESC>0f(a')
call Iab('whil', 'while () {<CR><CR>}<UP><UP><ESC>0f(a')
call Iab('ifelse', 'if () {<CR><CR>}<CR>else {<CR><CR>}<ESC>5k0f(a')
call Iab('ifb', 'if () {<CR><CR>}<UP><UP><ESC>0f(a')
call Iab('elib', 'else if () {<CR><CR>}<UP><UP><ESC>0f(a')
call Iab('elb', 'else {<CR>}<ESC>O')
call Iab('swb', 'switch () {<CR><CR>}<UP><UP><ESC>0f(a')
call Iab('intmain', 'int main(int argc, char ** argv) {<CR>}<ESC>O')
call Iab('intmainb', 'int main() {<CR>}<ESC>O')
call Iab('bb', '{<CR>}<ESC>O')
call Iab('ifnd', '#ifndef<CR>#define<CR>#endif<ESC>2kA')
call Iab('begenu','\begin{enumerate}<CR>\item <CR>\end{enumerate}<ESC>kcc')
call Iab('begitem','\begin{itemize}<CR>\item <CR>\end{itemize}<ESC>kcc')
call Iab('begeq','\begin{equation}<CR><CR>\end{equation}<ESC>kcc')
call Iab('begal','\begin{align}<CR><CR>\end{align}<ESC>kcc')
call Iab('begeqn','\begin{equation*}<CR><CR>\end{equation*}<ESC>kcc')
call Iab('begaln','\begin{align*}<CR><CR>\end{align*}<ESC>kcc')
call Iab('begend','\begin{}<CR>\end{}<ESC>k0f{ci{')