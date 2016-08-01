set autoindent
set autoread
set backupdir=$HOME/.vimbackup
set clipboard=unnamed,autoselect
set backup
set number
set t_Co=256

syntax enable
set background=dark
colorscheme hybrid

" change cursor shape on insert-mode
set timeoutlen=100 ttimeoutlen=0
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

