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
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
set showtabline=2
set noshowmode

