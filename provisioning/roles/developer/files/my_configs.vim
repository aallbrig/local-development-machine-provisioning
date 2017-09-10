set incsearch
set autoindent
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set ruler
set undolevels=1000
set backspace=indent,eol,start
set number
set list
set listchars=eol:$
set listchars+=tab:>-
set listchars+=trail:~
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=space:␣
" More natural splitting behavior
set splitbelow
set splitright
" Plugin manager of choice's line in "~/.vimrc" file (here, in diff
" location because that's just the vimrc boilerplate I chose.
call plug#begin('~/.vim/plugged')
" Target plugins in plugin manager of choice's syntax
Plug 'leafgarland/typescript-vim'
Plug 'chase/vim-ansible-yaml'
Plug 'kien/ctrlp.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'dsawardekar/wordpress.vim'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
" Woo, below is a multi-language test plugin!
" How useful.
Plug 'janko-m/vim-test'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

