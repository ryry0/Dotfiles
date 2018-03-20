syntax on
set ignorecase  "ignore case in search patterns
set smartcase   "override ignorecase if search has capital letters

set incsearch
set showmatch   "jump to matching bracket if new is inserted
set hlsearch

set nosol       "don't change cursor column when moving
set shm=at      "shortens messages to minimum
set scrolloff=2 "leaves 2 lines at top and bottom of screen from cursor

set relativenumber | set number
set cursorline  "underline current line
set splitright  "open splits to the right.
set splitbelow  "open splits below.

set hidden      "hide buffers
set exrc        "allows local configurations of .vimrc
set nobackup    "disable backup files

set backspace=indent,eol,start "sets backspace to work like normal

"enable mouse support but remove mouse left click
set mouse=a
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
vmap <LeftMouse> <nop>

nmap <2-LeftMouse> <nop>
imap <2-LeftMouse> <nop>
vmap <2-LeftMouse> <nop>

"use z= to use spellcheck
set spelllang=en_us

"formatting and indentation
set lbr "don't break words in middle
set expandtab "replace all tabs with spaces

"indent settings
set autoindent
set copyindent
set smartindent

"toggle paste mode to properly indent text when copying
"get the mapping in normal mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2> "map it in insert mode
set showmode         "shows modeline on statusline
set showcmd          "shows the current command on statusline

"look for tags in current directory, then move up until root
set tags=./tags;/

"set path to current working directory
set path=$PWD/**

"filetype options
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"wildmenu popup settings
if has("wildmenu")
        set wildignore+=*.a,*.o,*.aux,*.brf,*.out,*.x
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
        set wildignore+=.DS_Store,.git,.hg,.svn,*.pdf
        set wildignore+=*~,*.swp,*.tmp
        set wildmenu
        set wildignorecase
        set wildmode=longest:full,full
endif

"win32 specific mappings
if has("win32")
        set t_Co=256
        if has("gui_running")
                set guifont=Consolas:h11:cANSI
                "colorscheme slate
                :set guioptions-=m  "remove menu bar
                :set guioptions-=T  "remove toolbar
                :set guioptions-=r  "remove right-hand scroll bar
                :set guioptions-=L  "remove left-hand scroll bar
        endif
        colorscheme PaperColor
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
        set undodir=$HOME/.temp/und//
        set undofile
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-a><C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-a><C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif


"control mappings
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"set c-p/n to work like up/down in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"nnoremap : :set norelativenumber \| set number<CR>:

"sets intuitive word wrapped line movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"normal/command mode esc mappings
cnoremap jk <C-f>
inoremap jk <ESC>
cnoremap kj <C-f>
inoremap kj <ESC>

inoremap Jk <ESC>
inoremap JK <ESC>
inoremap jK <ESC>

inoremap kJ <ESC>
inoremap KJ <ESC>
inoremap Kj <ESC>

"move up and down one screen with c-j/k
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

"remove annoying keys
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K kJ
vnoremap K <nop>

"set leader to spacebar
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

"X related buffer mappings
noremap <leader>y "+y
noremap <leader>Y "+Y

vnoremap <leader>y "+y
vnoremap <leader>Y "+Y

"allows you to open command line history using q;
nnoremap q; q:

"jumps back if you have made a local edit
noremap <leader>; g;g;

"buffer related mappings
"opens previous buffered file.
nmap <leader>e :e#<CR>
nnoremap <leader>f :ls<CR>:b<SPACE>
nnoremap <leader>l :ls<CR>

nnoremap <C-n> :next<CR>
nnoremap <C-p> :prev<CR>

"mistyped B->b autocorrect
cnoreabbrev <expr> B ((getcmdtype() is# ':' && getcmdline() is# 'B')?('b'):('B'))

"Map for relative filepath expansion
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"conversion mappings
command Edos e ++ff=dos
command Enix e ++ff=dos<CR> :setlocal ff=unix<CR>


"clears all trailing whitespaces
nmap <leader><TAB> :%s/\s\+$// <CR>

"window pane mappings
nnoremap <leader>p <C-w>
vnoremap <leader>p <C-w>

"command line shortcuts
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>

"save as root
nnoremap <leader>W :w !sudo tee %<CR>

"mistyped Q->q autocorrect
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

nnoremap <leader>5 :%
nnoremap <leader>s :mks! session.vim<CR>

"map leader v to ctrl v
nmap <leader>v <C-v>

"map leader i = ctrl a (increment)
nmap <leader>i <C-a>

"map leader d = ctrl x (decrement)
nmap <leader>d <C-x>

"map for making quick x-y-z sequences in columns
nnoremap <leader>x rxjryjrz
nnoremap <leader>X rXjrYjrZ

"maps for make/make error
nmap <leader>m :w<CR>:make!<CR>
nmap <leader>n :cn<CR>
nmap <leader>N :cp<CR>

"maps for indentation
nmap <leader>{ =i{
nmap <leader>[ =i{
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

"smooth scrolling mappings
"nnoremap <C-E> :call SmoothScroll(1)<Enter>
nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

"relative number toggle map
nnoremap <f5> :call NumberToggle() <cr>
nmap <leader># :call NumberToggle() <cr>

"autocommands to change relativenumber
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber | set number

"resize vimsplits when new tmux window is opened
autocmd VimResized * wincmd =

"file styling options
"tab styling options
"no spell check
"tabs are 2 spaces
"trailing whitespace is highlighted
"no indent of namespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

autocmd BufNewFile,BufRead *.ino setf c
autocmd BufNewFile,BufRead *.pde setf c

autocmd FileType elm,arduino,c,cpp set nospell | set softtabstop=2
                        \| set tabstop=2 | set shiftwidth=2
                        \| match ExtraWhitespace '\s\+$' | set cino=N-s
                        \| autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
                        \| autocmd InsertLeave * match ExtraWhitespace /\s\+$/
                        \| set formatoptions+=t | set textwidth=80
                        \| Cabbrev


autocmd FileType java set nospell | set softtabstop=2
                        \| set tabstop=4 | set shiftwidth=4
                        \| match ExtraWhitespace '\s\+$' | set cino=N-s
                        \| autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
                        \| autocmd InsertLeave * match ExtraWhitespace /\s\+$/
                        \| set formatoptions+=t | set textwidth=80
                        \| Cabbrev

autocmd FileType python setlocal nosmartindent | set textwidth=80
autocmd FileType kivy setlocal nosmartindent | set textwidth=80

autocmd Filetype make setlocal noexpandtab

"Markdown Bindings
autocmd BufNewFile,BufRead *.md set spell | set formatoptions+=t | set softtabstop=4
                        \| set tabstop=4 | set shiftwidth=4
                        \| set textwidth=80 | LatAbbrev

"Latex bindings
"set auto spellcheck on latex files only
autocmd BufNewFile,BufRead *.tex set spell | set formatoptions+=t
                        \| set textwidth=80 | LatAbbrev

let g:tex_flavor = "latex"
"set no spell checking in latex comments.
let g:tex_comment_nospell = 1

"functions
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
        sleep 2m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction


xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
        let temp = @s
        norm! gv"sy
        let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
        let @s = temp
endfunction

" Search in all currently opened buffers
function! ClearQuickfixList()
  call setqflist([])
endfunction
function! Vimgrepall(pattern)
  call ClearQuickfixList()
  exe 'bufdo vimgrepadd ' . a:pattern . ' %'
  copen
endfunction

command! -nargs=1 Vim call Vimgrepall(<f-args>)
