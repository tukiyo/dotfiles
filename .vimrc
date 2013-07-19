sy on
set nonu
highlight Search ctermbg=Blue ctermfg=Black
set nowrapscan
set laststatus=2
set statusline=%<[%n]%m%r\ %f%=\ %l,%c%V%6P%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y
set scrolloff=5
if exists("&ambiwidth")
    set ambiwidth=double
endif
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
filetype on
colorscheme desert
se nowrap

" 文字コード判定
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac

"折りたたみ
"set foldlevel=2
"set foldmethod=indent

" indent
set autoindent
set cindent
set smarttab

" search
set incsearch
set hlsearch

au BufRead,BufNewFile *.md :set ft=markdown
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if or(&ft == '',&ft == 'conf') | :se ft=nginx | endif
au BufNewFile *.py :0r ~/.vim/snippet/utf8.py | :echo "snippet read."

" map
let mapleader = ","
map <C-c> <Esc>
"map <C-^> :bp<cr>
map ; '
map <leader>a :Ack<space>
vmap <leader>= :Alignta 
map <leader>h :MRU<cr>
map <leader>c :cd %:h<cr>:pwd<cr>
map <leader>v :vimgrep // **/*.*\|cwin<C-b><Right><Right><Right><Right><Right><Right><Right><Right><Right>
map <leader>f :vimgrep // %\|cwin<C-b><Right><Right><Right><Right><Right><Right><Right><Right><Right>
map <leader>q :q<cr>
map <leader>, :marks<cr>
map <leader>. :e .<cr>
map <leader>S :mksession! ~/local/Session.vim<cr>
map <leader>L :so ~/local/Session.vim<cr>

let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$'

" QuickRun
let g:quickrun_config = {
\   "_" : {
\       "hook/inu/enable" : 1,
\       "hook/inu/wait" : 20,
\       "outputter/buffer/split" : ":botright 8sp",
\       "outputter/buffer/append" : 1,
\       "runner/vimproc/updatetime" : 40,
\       "runner" : "vimproc",
\   }
\}
"map <leader>r :QuickRun<cr>
