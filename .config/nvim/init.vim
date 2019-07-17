" UTF-8 as encoding
set encoding=utf-8

" Not compatible with vi
set nocompatible

" Plugins
call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Tabs as 4 spaces
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

" Indentation
set autoindent
set cindent

" Preceding line numbers
set number

" Improve color support
set termguicolors
set background=dark

" Color-Scheme
colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'

" Resume editing a file
:au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

" Syntax highlighting and filetype recognition
syntax on
filetype indent plugin on

