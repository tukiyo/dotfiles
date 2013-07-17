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
set smartindent
set cindent
set smarttab

" search
set incsearch
set hlsearch

autocmd FileType modula2 :set ft=markdown

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

let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$'
