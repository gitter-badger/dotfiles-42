set autoindent
set dir=$HOME/.vim/tmp
set backupdir=$HOME/.vimbackup
set clipboard=unnamed,autoselect
set backup
set number
set t_Co=256
set ts=4 sw=4 sts=4 expandtab
set backspace=2

autocmd BufNewFile,BufRead *.md setlocal ts=2 sw=2 sts=2
autocmd FileType ruby setlocal ts=2 sw=2 sts=2

syntax enable
set background=dark
colorscheme hybrid

" Powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set showtabline=2
set noshowmode

