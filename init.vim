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
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
"Plug 'davidhalter/jedi-vim'
Plug 'cstrahan/vim-capnp'

" s,f,t quick search
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
call plug#end()

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

set number
set noswapfile
" Enable GUI mouse behavior
set mouse=a

set noshowmode

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

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 200)

" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

" Leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

" Ale
let g:ale_c_gcc_options = "-Wall"
let g:ale_c_gcc_executable = "gcc"
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = 'ᳵ'
let g:ale_sign_warning = '⚠'
" airlane ale config
let airline#extensions#ale#error_symbol = 'ᳵ '
let airline#extensions#ale#warning_symbol = '⚠ '
let airline#extensions#ale#open_lnum_symbol = '['
let airline#extensions#ale#close_lnum_symbol = ']'
"let g:ale_open_list = 'on_save'
"let g:ale_open_quick_fix = 1
" cycle through location list
nmap <silent> <leader>n <Plug>(ale_next_wrap)
nmap <silent> <leader>p <Plug>(ale_previous_wrap)

" Denite
" reset 50% winheight on window resize
augroup deniteresize
    autocmd!
    autocmd VimResized,VimEnter * call denite#custom#option('default',
                \'winheight', winheight(0) / 2)
augroup end

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#option('default', {
            \ 'prompt': '❯'
            \ })

call denite#custom#var('file/rec', 'command',
            \ ['fd', '--full-path', '-E', '*.o'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--hidden', '--vimgrep', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
            \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
            \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
            \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
            \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
            \'noremap')

nnoremap <C-p> :<C-u>Denite file/rec<CR>
nnoremap <leader>b :<C-u>Denite buffer<CR>
nnoremap <leader>B :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <leader>/ :<C-u>Denite grep:.<CR>
nnoremap <leader>? :<C-u>DeniteBufferDir grep:.<CR>
nnoremap <leader>f :<C-u>DeniteBufferDir file/rec<CR>
"nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
nnoremap <leader>R :<C-u>Denite register:.<CR>
hi link deniteMatchedChar Special

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_refresh_delay', 0)
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
" tab for completion but not on start of line
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()

" Python
autocmd FileType python setlocal colorcolumn=80

" Latex preview
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

" Grammarous
let g:grammarous#disabled_rules = {
            \ '*' : ['WORD_CONTAINS_UNDERSCORE'],
            \ }
autocmd FileType gitcommit,tex,latex setlocal spell spelllang=en_us
"autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" Startify
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


" Polyglot
let g:polyglot_disabled = ['latex', 'markdown']

" sneak
let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1
let g:sneak#prompt = '⇢ '

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=256
highlight QuickScopePrimary guifg='#ffffff' guibg='#000000' gui=bold ctermfg=0 ctermbg=255 cterm=bold
highlight QuickScopeSecondary guifg='#ffff00' guibg='#000000' gui=bold ctermfg=0 ctermbg=180 cterm=bold


" KEY MAPS
" disable ex mode
nnoremap Q <nop>
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
" - open terminal
nnoremap <Leader><CR> <C-w><C-v>:terminal <CR>i
" - vim fugitive
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>s :Gstatus<CR>
" - re indent file
map <F7> gg=G<C-o><C-o>:ALEFix <CR>:w <CR>
" clear selection
nnoremap <leader>n <Esc>:noh<CR>
" search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" replace visual selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
