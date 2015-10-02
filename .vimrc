syntax enable                      " 语法高亮
set background=dark
colorscheme solarized
set tabstop=2
set shiftwidth=2
set laststatus=2
"set dictionary+=$HOME/.mydict
"set dictionary+=/usr/share/dict/words
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

"set guifont=Menlo:h16
"set rtp+={path_to_powerline}/powerline/bindings/vim
"set laststatus=2
"set noshowmode

nnoremap < v<
nnoremap > v>
vnoremap < <gv
vnoremap > >gv

"移除行尾空格
map <F2> :%s/\s*$//g<cr>:noh<cr>
map <F7> :NERDTreeToggle<CR>

"set cursorline "高亮光标所在行
"let Tlist_Use_Right_Window=1 "方法列表放在屏幕的右侧

"set list "把制表符显示为^I,用$标示行尾（使用list分辨尾部的字符是tab还是空格）

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"{{{ tpope/vim-fugitive Git命令集合
Bundle 'tpope/vim-fugitive'
if executable('git')
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  endif
  "}}}
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'airblade/vim-gitgutter'

Bundle 'git://github.com/Lokaltog/vim-powerline.git'
let g:Powerline_symbols = 'fancy'
let Powerline_symbols = 'compatible'

Bundle 'pangloss/vim-javascript'
Bundle 'xml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'asins/vim-css'
Bundle 'majutsushi/tagbar'
Bundle 'grep.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-surround'
nnoremap <silent> <C-f> :Grep<CR>

" {{{ asins/template.vim 文件模板
Bundle 'asins/template.vim'
Bundle 'vim-multiple-cursors'
let g:template_author = "Asins"
" }}}

Bundle 'AutoComplPop'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
" install ctags first
Bundle 'vim-scripts/taglist.vim'
Bundle 'elzr/vim-json'
Bundle 'kchmck/vim-coffee-script'

" 复制选中文本到系统剪贴板
vnoremap <leader>yo "*y
" 从系统剪贴板粘贴内容
nnoremap <leader>po "*p
" 选中模式 Ctrl+c 复制选中的文本
vnoremap <c-c> "+y
" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @+ = expand('%:p')<cr>

" 删除所有行未尾空格
nnoremap <silent> <f12> :%s/[ \t\r]\+$//g<cr>

" Javascript {{{
autocmd BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.tpl setlocal ft=tpl syntax=html
" JSON syntax
autocmd BufRead,BufNewFile *.json setlocal ft=json
" }}}
" Markdown {{{
autocmd FileType markdown setlocal shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.mk setlocal filetype=markdown
" }}}

" Ruby 文件的一般设置，比如不要 tab 等
autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 expandtab

filetype plugin indent on     " required!

" 打开文件时自动打开 NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"
" Brief help
" :BundleList          - list configured bundles 
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.. 
" set t_Co=256

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9,ruby-2.0'

let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8'

let g:mapleader = ","
map <Leader>d orequire 'byebug'; byebug<esc>
