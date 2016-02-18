set autoindent
set backupdir=$HOME/vimbackup
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
set background=dark
set t_Co=256
set timeoutlen=100 ttimeoutlen=0

filetype indent on
syntax on
filetype off

colorscheme molokai

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'jimsei/winresizer'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\     'mac' : 'make -f make_mac.mak',
			\     'unix' : 'make -f make_unix.mak',
			\    },
			\ }
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
			\ 'insert' : 1,
			\ 'filetypes': 'ruby',
			\ }}
NeoBundle 'xolox/vim-session', {
			\ 'depends' : 'xolox/vim-misc',
			\ }
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-obsession'

call neobundle#end()

let g:neocomplete#enable_at_startup = 1
let g:rspec_command = "Dispatch rspec {spec}"
let g:unite_enable_start_insert = 1

" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" RSENSE_HOMEの環境変数
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

" vim-session
" 現在のディレクトリ直下の .vimsessions/ を取得
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
if isdirectory(s:local_session_directory)
	" session保存ディレクトリをそのディレクトリの設定
	let g:session_directory = s:local_session_directory
	" vim終了時に自動保存
	let g:session_autosave = 'yes'
	" 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
	let g:session_autoload = 'yes'
	" 5分間に1回自動保存
	let g:session_autosave_periodic = 5
else
	let g:session_autosave = 'no'
	let g:session_autoload = 'no'
endif
unlet s:local_session_directory

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby']}
let g:syntastic_ruby_checkers = ['rubocop']

" endwise
function! s:my_crinsert()
	return pumvisible() ? neocomplcache#close_popup() : "\<Cr>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>

" unite
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>

" ctrlp.vim
nnoremap <silent> ,cp :<C-u>CtrlP<CR>

" tab
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>:tabmove<CR>

" search
nnoremap <silent> <C-L> :noh<C-L><CR>

" buffers
nnoremap <silent> ;; :<C-u>buffers<CR>

" Insertモードのときカーソルの形状を変更
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
