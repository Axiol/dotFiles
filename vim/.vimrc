" Install plugins
call plug#begin('~/.vim/plugged')

Plug 'L9'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'joonty/vim-phpqa'
Plug 'chaquotay/ftl-vim-syntax'
Plug 'mhinz/vim-startify'
Plug 'townk/vim-autoclose'
Plug 'docunext/closetag.vim'
Plug 'morhetz/gruvbox'
Plug 'evidens/vim-twig'

call plug#end()

" Enable line numbers
set number

" Enable relative numbers
set rnu

" Enable syntax and set the right colors
syntax on
set background=dark
colorscheme gruvbox

" Set tabs to spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Make the backspace working like most editor
set backspace=indent,eol,start

" Disable line wrap
set nowrap

" Make ctrlp index everything
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1

" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=/Users/arnaud.delante/Documents/coder/coder_sniffer/Drupal/ruleset.xml"

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Reload files when changed outside of vim
set autoread
autocmd FocusGained,BufEnter * :checktime

" Set history limit to 1000
set history=1000

" Shortcuts
nmap ,p :CtrlP<CR>
nmap ,b :NERDTreeToggle<CR>
nmap ,n :tabe<CR>
