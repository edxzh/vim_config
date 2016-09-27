syntax enable                      " 语法高亮
set background=dark
colorscheme solarized
set tabstop=2
set shiftwidth=2
set laststatus=2
set isk+=- "把-分割的单词视为一个整体
set mouse=nv
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
set autoindent
set cindent
set sw=2
set ts=2
set expandtab
set number                     " 行号
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
" 关闭错误声音
set noerrorbells
"显示括号配对情况
set showmatch
" 当有多余的空格时显示.号
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set backspace=indent,eol,start
set nocompatible               " be iMproved
set t_Co=256
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'tpope/vim-endwise'
Bundle 'auto-pairs'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'godlygeek/tabular'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/matchit.zip'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/grep.vim'

Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'pangloss/vim-javascript'
Bundle 'xml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'asins/vim-css'
Bundle 'tpope/vim-surround'
Bundle 'vim-multiple-cursors'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
" install ctags first
Bundle 'vim-scripts/taglist.vim'
Bundle 'elzr/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'AutoComplPop'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-ruby/vim-ruby'

filetype off                   " required!
filetype plugin indent on     " required!

autocmd BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.tpl setlocal ft=tpl syntax=html
autocmd BufRead,BufNewFile *.json setlocal ft=json
autocmd FileType markdown setlocal shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.mk setlocal filetype=markdown
" Ruby 文件的一般设置，比如不要 tab 等
autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 expandtab
" 打开文件时自动打开 NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

let Tlist_Use_Right_Window=1 "方法列表放在屏幕的右侧
let g:Powerline_symbols = 'fancy'
let Powerline_symbols = 'compatible'
" grep.vim settings
let Grep_Default_Options = '-ir'

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9,ruby-2.0'

let g:mapleader = ","

let Grep_Default_Options = '-ir'

map <Leader>d orequire 'byebug'; byebug<esc>

map <Leader>N :NERDTreeToggle<cr>
"Reveal file in NerdTree
map <Leader>R :NERDTreeFind<cr>
map <Leader>/  <plug>NERDCommenterToggle<cr>
"Grep.vim
map <Leader>f :Grep<cr>
"Format JSON - filter the file through Python to format it
map <Leader>j :%!python -m json.tool<cr>
"Show ctags - TagList plugin
map <leader>t :TlistToggle<cr>
"Build ctags (requires exuberant-ctags)
map <leader>T :!ctags -R .<cr>

" Copy the file path to buffer
map <silent> <Leader>c :let @+ = expand("%")<cr>
" visual mode Ctrl+c copy visual text
vnoremap <leader>yo "*y
" paste from clipboard
nnoremap <leader>po "*p

" tabularize plugin, auto align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

nnoremap < v<
nnoremap > v>
vnoremap < <gv
vnoremap > >gv

"window movement/operations
map <leader>+ <c-w>+
map <leader>- <c-w>-
map <leader>= <c-w>=
map <leader>_ <c-w>_

"{{{ tpope/vim-fugitive Git命令集合
if executable('git')
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
endif
"}}}

" move line up and down
nnoremap <S-Up>   :<C-u>silent! move-2<CR>==
nnoremap <S-Down> :<C-u>silent! move+<CR>==
xnoremap <S-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <S-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" search and replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

if has("gui_running")
  set guioptions=aAce
  set showtabline=2
  set guifont=Monaco:h13
  "set guifont=Menlo:h16
  "set rtp+={path_to_powerline}/powerline/bindings/vim
  "set laststatus=2
  "set noshowmode
endif

map <F2> :MRU<cr>
let MRU_Max_Entries=1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*' 

fun! GetSnipsInCurrentScope()
  let snips = {}
  for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
    call extend(snips, get(s:snippets, scope, {}), 'keep')
    call extend(snips, get(s:multi_snips, scope, {}), 'keep')
  endfor
  return snips
endf
