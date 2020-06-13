" Vim-Plug
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'

"latex
Plug 'lervag/vimtex'

" home/sessions
Plug 'mhinz/vim-startify'

" s,f,t quick search
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

Plug 'cstrahan/vim-capnp'

call plug#end()

" ----- Gruvbox -----
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

set number
set noswapfile
" Enable GUI mouse behavior
set mouse=a

set lazyredraw

set splitright
set splitbelow

set hidden "change buffer without saving changes

" Default tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cursorline

set incsearch
set ignorecase
set smartcase

" Leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

" Highlight yanks
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 200)

" Spelling
autocmd FileType gitcommit,tex,latex setlocal spell spelllang=en_us

" Python column line
autocmd FileType python setlocal colorcolumn=80


" ----- Airline -----
" tell vim to not show modes, let airline do it
set noshowmode
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''
" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Always show tabs
set showtabline=2
" Sections
let g:webdevicons_enable_airline_tabline = 1


" ----- Vimtex -----
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pvc',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \ 'build_dir' : 'out',
    \}
let g:vimtex_quickfix_enabled = 0


" ----- Startify -----
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = ['Welcome back.']
let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [
            \ {'i' : '~/.config/nvim/init.vim'},
            \ {'z' : '~/.zshrc'}
            \ ]


" ----- Sneak -----
let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1
let g:sneak#prompt = '⇢ '


" ----- Quickscope -----
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=256
highlight QuickScopePrimary guifg='#ffffff' guibg='#000000' gui=bold ctermfg=0 ctermbg=255 cterm=bold
highlight QuickScopeSecondary guifg='#ffff00' guibg='#000000' gui=bold ctermfg=0 ctermbg=180 cterm=bold


" ----- Vim-FuGITive
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>s :Gstatus<CR>


" -----> GENERAL KEY MAPS <-----
" Disable ex mode
nnoremap Q <nop>
" Save
nnoremap <Leader>w <Esc>:w<C-M>
" Save and quit
nnoremap <Leader>q <Esc>:wq<C-M>
" Quit without saving
nnoremap <Leader>Q <Esc>:q!<C-M>
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
" Open terminal
nnoremap <Leader><CR> <C-w><C-v>:terminal <CR>i
" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>
" Clear selection
nnoremap <leader>n <Esc>:noh<CR>
" Search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Replace visual selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
