set nocompatible
filetype off

" vundle shit
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'tpope/vim-vinegar'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'kh3phr3n/python-syntax'

Plugin 'honza/vim-snippets'

Plugin 'beigebrucewayne/Turtles'
Plugin 'flazz/vim-colorschemes'
call vundle#end()
filetype plugin indent on

"colorscheme molokai
colorscheme Tomorrow-Night
syntax on
set number
set relativenumber
set incsearch

set wildmode=longest,list,full
set wildmenu

set laststatus=2

let mapleader="\<Space>"
let g:mapleader="\<Space>"

" TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" lightline config
let g:lightline = {
  \ 'colorscheme' : 'wombat',
  \ }

" KEY MAPS
" - tabs
nnoremap H gT
nnoremap L gt
" - disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" - switching panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" - FZF
nnoremap <Leader>f <Esc>:FZF<C-M>
