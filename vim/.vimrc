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
" turn off error bell
set vb t_vb=
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
set clipboard=unnamed
set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim

filetype off

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/grep.vim'

Plugin 'vim-test/vim-test'

Plugin 'git://github.com/Lokaltog/vim-powerline.git'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
" snippets plugin rely on this two lib
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" install ctags first
Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json'
Plugin 'asins/template.vim'
Plugin 'AutoComplPop'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mru.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-repeat'

Plugin 'moll/vim-node'
Plugin 'ternjs/tern_for_vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'ryanoasis/vim-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call vundle#end()

filetype on                   " required!
filetype plugin indent on     " required!

autocmd BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.tpl setlocal ft=tpl syntax=html
autocmd BufRead,BufNewFile *.json setlocal ft=json
autocmd FileType markdown setlocal shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.mk setlocal filetype=markdown
" 打开文件时自动打开 NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" Ruby 文件的一般设置，比如不要 tab 等
autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 expandtab

let g:mapleader = ","

let Tlist_Use_Right_Window=1 "方法列表放在屏幕的右侧
let g:template_author = "StarZhou"
let g:Powerline_symbols = 'fancy'
let Powerline_symbols = 'compatible'

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

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

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

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

" search and replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" MRU
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

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }
