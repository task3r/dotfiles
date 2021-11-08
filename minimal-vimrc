" set nocompatible

" Load plugins according to detected filetype.
filetype plugin indent on
syntax on

set number
set noswapfile
"
" Enable GUI mouse behavior
set mouse=a

set lazyredraw

set splitright
set splitbelow

" Default tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set incsearch
set ignorecase
set smartcase

" Always show tabs
set hidden "change buffer without saving changes
set nobackup
set nowritebackup
set cmdheight=2

colorscheme elflord

set cursorline
hi CursorLine   cterm=NONE ctermbg=16 ctermfg=NONE
hi CursorLineNR cterm=NONE ctermbg=16 ctermfg=NONE

set colorcolumn=80
hi ColorColumn cterm=NONE ctermbg=16 ctermfg=NONE

" Leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

" Spelling
autocmd FileType gitcommit,tex,latex,vimwiki setlocal spell spelllang=en_us

" -----> GENERAL KEY MAPS <-----
" Disable ex mode
nnoremap Q <nop>
" Save
nnoremap <Leader><Space> <Esc>:w<C-M>
" switching panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Close buffer
nnoremap <Leader>W <Esc>:bd<CR>
" Cycling buffers
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>
" Clear selection
nnoremap <leader>n <Esc>:noh<CR>
" Search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Replace visual selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
