set nocompatible  " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" https://github.com/amix/vimrc
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>x :q<cr>
nmap <leader>qq :q!<cr>

" RSpec.vim mappings
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set ts=2
set ruler
set encoding=utf8

"set list
"set list listchars=tab:│·,trail:·,precedes:←,extends:→,eol:↲,nbsp:~
"set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set lcs+=space:·

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
" set smarttab

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

set autoindent
" set smartindent
set wrap "Wrap lines

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" set paste
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

" CtrlP plugin
let g:ctrlp_map = '<Leader>e'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vvendor$|node_modules$|tmp$|\.git$|\.hg$|\.svn$'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
  \ 'PrtHistory(-1)':       ['<down>'],
  \ 'PrtHistory(1)':        ['<up>'],
  \ 'MarkToOpen()':         ['<c-a>'],
  \ }
map <Leader>f :CtrlPCurFile<CR>
map <Leader>r :CtrlPMRUFiles<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>g :CtrlPLine<CR>
map <Leader>t :CtrlPBufTag<CR>
map <Leader>T :CtrlPBufTagAll<CR>

" netrw
" https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:netrw_altv = 1
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_keepdir = 0

" augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
" augroup END

" Panes
map <Leader>\ :vsp<CR>
map <Leader>- :sp<CR>
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

map + <C-W>>
map - <C-W><
map = <C-W>=

" Toggle Vexplore with Ctrl-E
" https://stackoverflow.com/questions/5006950/setting-netrw-like-nerdtree
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <Leader><CR> :call ToggleVExplorer()<CR>

" Autoremove trailing whitespace on buffer write (save)
autocmd BufWritePre * %s/\s\+$//e

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Send vim-rspec to tmux
let g:rspec_command = 'call Send_to_Tmux("bin/spring rspec {spec}\n")'
