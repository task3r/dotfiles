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

" intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"latex
Plug 'lervag/vimtex'

" home/sessions
Plug 'mhinz/vim-startify'

" s,f,t quick search
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

Plug 'cstrahan/vim-capnp'

call plug#end()

set number
set noswapfile
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


" ----- Gruvbox -----
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark


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
"let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Always show tabs
set showtabline=2
" Sections
let g:webdevicons_enable_airline_tabline = 1


"\'coc-java', 
"\'coc-clangd',
" ----- CoC -----
let g:coc_global_extensions = [
            \'coc-jedi',
            \'coc-vimlsp',
            \'coc-actions', 
            \'coc-explorer',
            \'coc-lists'
            \]
" TextEdit might fail if hidden is not set.
set hidden "change buffer without saving changes
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <Leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader>p  :<C-u>CocListResume<CR>
" Show buffers
nnoremap <silent><nowait> <Leader>b :<C-u>CocList buffers<CR>
" Show buffers
nnoremap <silent><nowait> <Leader>/ :<C-u>CocList grep<CR>
" Explorer
nmap <Leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" ----- Vimtex -----
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pvc',
    \   '--shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \ 'build_dir' : 'out',
    \}
let g:vimtex_compiler_progname = 'nvr'
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
