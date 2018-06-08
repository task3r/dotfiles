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
Plugin 'sheerun/vim-polyglot'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/molokai'

"Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'

Plugin 'beigebrucewayne/Turtles'
Plugin 'flazz/vim-colorschemes'
Plugin 'arcticicestudio/nord-vim'
call vundle#end()
filetype plugin indent on

colorscheme molokai
"colorscheme turtles
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

let g:livepreview_previewer = 'apvlv'

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
" - Save
nnoremap <Leader>w <Esc>:w<C-M>
" - FZF
nnoremap <Leader>f <Esc>:FZF<C-M>
" - vim-go
au FileType go nmap <leader>r <Plug>(go-run)

function! SetupPython()
    " Here, you can have the final say on what is set.  So
    " fixup any settings you don't like.
    setlocal softtabstop=2
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction

"hi Normal guibg=NONE ctermbg=NONE
