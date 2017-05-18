" let g:no_turbux_mappings = 1
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'briancollins/vim-jst'
Plugin 'vim-scripts/Align'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'powerline/powerline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
map <leader>ff :CtrlP<CR>
map <leader>fb :CtrlPBuffer<CR>
map <leader>a  :Ag<space>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>t  :A<CR>
map <leader>ts :AS<CR>
map <leader>tv :AV<CR>
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>
map <leader>rh :Rhelper<CR>
map <leader>ru :Runittest<CR>
map <leader>rf :Rfunctionaltest<CR>
map <leader>ro :Robserver<CR>
map <leader>rv :Rview<CR>
map <leader>rl :Rlocale<CR>
map <Leader>ct :!ctags -R .<CR>

set laststatus=2
set encoding=utf-8
set wildmenu
set wildmode=list:longest
set splitright
set splitbelow
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set hidden
set number
set ic
set hlsearch
set incsearch
set noswapfile
set nobackup
set noeb vb t_vb=
set so=5
set foldmethod=syntax
set foldminlines=3
set foldlevel=100
set backspace=indent,eol,start
set autoread
cnoreabbrev W w
au GUIEnter * set vb t_vb=
au VimEnter * IndentGuidesEnable
au FocusLost * silent! :wa
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

nnoremap <Leader>[ :tabprevious<CR>
nnoremap <Leader>] :tabnext<CR>
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>

augroup vimrc
autocmd!
autocmd GuiEnter * set columns=120 lines=70 number
augroup END

autocmd BufRead,BufNewFile *.jst set filetype=javascript
autocmd BufRead,BufNewFile *.ebf,*.ctl set filetype=ruby
autocmd BufRead,BufNewFile *.rabl set filetype=ruby
autocmd BufWritePre * :%s/\s\+$//e

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
