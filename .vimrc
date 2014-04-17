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

set cursorline "高亮光标所在行
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
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ervandew/supertab'
Bundle 'tomtom/tcomment_vim'
Bundle 'airblade/vim-gitgutter'

filetype plugin indent on     " required!
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
