filetype plugin indent on
syntax on

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

"" More natural splitting behavior
set splitbelow
set splitright
set foldlevelstart=20

" Plugin Customizations
"" for Indent Guides plugin
let g:indent_guides_enable_on_vim_startup = 1

"" Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['sh', 'bash=sh', 'css', 'django', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'php', 'python', 'ruby', 'sass', 'xml', 'html']

"" Allow betterwhitespace to be turned on by default, and strip white space on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

