set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'arcticicestudio/nord-vim'

Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
set incsearch
set cursorline
set wildmode=longest,list,full
set wildmenu
set termguicolors

set laststatus=2

let mapleader="\<Space>"
let g:mapleader="\<Space>"

" Nord
set t_Co=256
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
let g:nord_comment_brightness = 8

colorscheme nord

" NERDTree
let NERDTreeMinimalUI=1

" Airline
let g:airline_theme='bubblegum'

" KEY MAPS
" - Save
nnoremap <Leader>w <Esc>:w<C-M>
" - switching panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" - NERDTree
noremap <leader>t :NERDTreeToggle<CR>

