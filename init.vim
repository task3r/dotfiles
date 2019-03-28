set number
set noswapfile
set smartcase

set splitright
set splitbelow

" Turn off statusbar, because it is externalized
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Enable GUI mouse behavior
set mouse=a

" All config settings after this point 
" can be removed, once an Oni config option is added.

" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

" Default tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

let mapleader="\<Space>"
let g:mapleader="\<Space>"


" KEY MAPS
" - Save
nnoremap <Leader>w <Esc>:w<C-M>
" - Quit without saving
nnoremap <Leader>q <Esc>:q!<C-M>
" - switching panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" - switching tabs
nnoremap H gT
nnoremap L gt

