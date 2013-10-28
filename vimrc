" let g:no_turbux_mappings = 1

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'vim-fugitive'
Bundle 'vim-easymotion'
Bundle 'vim-rails'
Bundle 'vim-cucumber'
Bundle 'vim-endwise'
Bundle 'nerdtree'
Bundle 'vim-coffee-script'
Bundle 'syntastic'
Bundle 'ctrlp.vim'
Bundle 'supertab'
Bundle 'vim-jst'
Bundle 'Align'
Bundle 'vim-indent-guides'
Bundle 'ag.vim'
Bundle 'vim-powerline'

syntax on
filetype plugin indent on

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

set nocompatible
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
set fu
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
au GUIEnter * set vb t_vb=
au VimEnter * IndentGuidesEnable
au FocusLost * silent! :wa
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

colorscheme JoshsAwesomeColors
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
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
