filetype plugin indent on
set mouse=a
set number
set hidden
set cursorline
set noswapfile
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=utf8
set nobackup
set clipboard=unnamedplus
set cindent


call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'tmsvg/pear-tree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'habamax/vim-habanight'

call plug#end()
"coc-extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-clangd',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier',
  \  'coc-html',
  \ 'coc-rust-analyzer'
  \ ]

  "\ 'coc-rls'
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_closers = 1
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }

augroup html_pairs
        autocmd!
        autocmd FileType html let b:pear_tree_pairs = {
            \ '<*>': {'closer': '</*>', 'not_if': ['br', 'meta', 'img']}
                    \ }
    augroup END

imap jk <ESC>
colorscheme gruvbox
let g:airline_theme='powerlineish'
set laststatus=2

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <F2> :call PreviousBuffer()<CR>
func! PreviousBuffer()
    exec "w!"
    exec "bn"
endfunc

nnoremap <silent> <F3> :call PreviousBuffer()<CR>
func! PreviousBuffer()
    exec "w!"
    exec "bp"
endfunc

autocmd FileType cpp nnoremap <F4> :0r ~/.config/nvim/template.cpp <CR>

autocmd FileType cpp nnoremap <silent> <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
silent:    exec "w"
silent:    exec '!g++ % -o %<'
        exec '! ./%<'
endfunc
autocmd FileType rust nnoremap <silent> <F5> :call CompileRunRust()<CR>
func! CompileRunRust()
silent:    exec "w"
        exec '!cargo run'
endfunc

autocmd FileType rust nnoremap <silent> <F5> :call CompileTestRust()<CR>
func! CompileTestRust()
silent:    exec "w"
        exec '!cargo test'
endfunc
autocmd FileType python nnoremap <F5> :call CompileRunPy()<CR>
fun! CompileRunPy()
    exec "w"
    exec "FloatermNew --autoclose=0 python3 %"
endfunc

autocmd FileType html nnoremap <F5> :call CompileRunHtml()<CR>
fun! CompileRunHtml()
    exec "w"
    exec "! google-chrome %"
endfunc


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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

