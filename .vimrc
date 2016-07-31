set autoindent
set autoread
set backupdir=$HOME/.vimbackup
set clipboard=unnamed,autoselect
set nocompatible
set expandtab
set incsearch
set number
set shiftwidth=2
set tabstop=2
set showmatch
set smartcase
set smartindent
set smarttab
set backup
set ruler
set cmdheight=2
set cmdheight=2
set laststatus=2
set title
set wildmenu
set showcmd
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set backupskip+=/home/tmp/*,/private/tmp/*
set t_Co=256
set timeoutlen=100 ttimeoutlen=0
filetype indent on
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

syntax enable
set background=dark
colorscheme hybrid

" change cursor shape on insert-mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set showtabline=2
set noshowmode

