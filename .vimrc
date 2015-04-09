" https://github.com/amix/vimrc
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>qq :q!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set ts=2
set ruler
set encoding=utf8

set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set expandtab
set shiftwidth=2
set tabstop=2

" Folding
"set foldmethod=indent
"setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
"set foldlevel=3
"set foldtext=getline(v:foldstart)
"set fillchars=fold:\ "(there's a space after that \)
"highlight Folded ctermfg=None ctermbg=Black

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

set number
set ignorecase
set smartcase
set magic
set showmatch
set mat=2

" Search
set hlsearch
set incsearch
hi Search ctermfg=NONE ctermbg=lightgray  cterm=bold,underline

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax on

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

nmap <C-j> zo
imap <C-j> zo

nmap <C-k> zc
imap <C-k> zc

:filetype plugin on
