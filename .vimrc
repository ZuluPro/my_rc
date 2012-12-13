set nocompatible
set ruler

syntax on
set nu
set wildignore=*.o,*~,*.pyc

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set ffs=unix,dos,mac

" Filetype
filetype plugin on
filetype indent on

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set incsearch
set showcmd

" Remember cursor
if has("autocmd")
    filetype plugin indent on
    autocmd FileType text setlocal textwidth=78

    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
    \ endif
endif
