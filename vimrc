" let g:no_turbux_mappings = 1
set nocompatible              " be iMproved, required
filetype off                  " required

" --- Vim-Plug Setup ---
" This section handles Vim-Plug's self-installation.
" It checks if Vim-Plug is already installed and, if not, downloads it.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Specify a directory for plugins
" This is where Vim-Plug will install all your plugins.
" It defaults to ~/.vim/plugged, but explicitly setting it is good practice.
call plug#begin('~/.vim/plugged')

" --- Your Plugins (Converted from Vundle to Vim-Plug) ---

" Vim-Plug itself (managed like any other plugin)
Plug 'junegunn/vim-plug'

" Your plugins: 'Plugin' becomes 'Plug'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'briancollins/vim-jst'
Plug 'vim-scripts/Align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'powerline/powerline'

" --- End Plugin List ---

" Initialize plugin system
call plug#end()

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
