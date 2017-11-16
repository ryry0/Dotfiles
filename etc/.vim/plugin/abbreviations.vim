
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
function! CAbbrev()
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
endfunction

"Latex abbreviations :
function! LatAbbrev()
        call Iab('begenu','\begin{enumerate}<CR>\item <CR>\end{enumerate}<ESC>kcc')
        call Iab('begitem','\begin{itemize}<CR>\item <CR>\end{itemize}<ESC>kcc')
        call Iab('begeq','\begin{equation}<CR><CR>\end{equation}<ESC>kcc')
        call Iab('begal','\begin{align}<CR><CR>\end{align}<ESC>kcc')
        call Iab('begeqn','\begin{equation*}<CR><CR>\end{equation*}<ESC>kcc')
        call Iab('begaln','\begin{align*}<CR><CR>\end{align*}<ESC>kcc')
        call Iab('begend','\begin{}<CR>\end{}<ESC>k0f{ci{')
        call Iab('begm','\begin{bmatrix}<CR>\end{bmatrix}<ESC>O')
        call Iab('sli','\includegraphics[page=,width=\textwidth]{\slides}<ESC>F,i')
        call Iab('slif','\includepdf[pages=]{\slides}<ESC>F=a')
        call Iab('fj','{}<ESC>i')
        call Iab('begad','\begin{aligned}<CR><CR>\end{aligned}<ESC>kcc')
        call Iab('sl','\')
        call Iab('$$$', '$$<CR>$$<ESC>O')
        call Iab('vec','\vec{')
        call Iab('frac','\frac{}{b}<ESC>F{F{a')
        call Iab('thet','\theta')
        call Iab('tau','\tau')
        call Iab('dvec','\dot{\vec{}}<ESC>F{a')
        call Iab('ddvec','\ddot{\vec{}}<ESC>F{a')
endfunction

command! Cabbrev call CAbbrev()
command! LatAbbrev call LatAbbrev()
