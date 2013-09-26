" Pathogen!
execute pathogen#infect()

" Increase history
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Configure backspace so it acts normally
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use buffers
set hidden

" Use ruler
set ruler

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"set smarttab

" Linebreak on 500 characters
"set lbr
"set tw=500
set tw=79
set cc=+1

set noci " Disable C indent
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" Settings for specific file types
autocmd FileType ruby,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set some filetypes for rails
autocmd BufNewFile,BufRead *.handlebars,*.html.erb setlocal filetype=html

" Set 3 lines to the cursor when moving using j/k
set so=3

" Wild meu
set wildmenu
set wildmode=list:longest

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" Magic!?
set magic

" Show matching brackets
set showmatch

" Remove annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax on

if has("gui_running")
    "colorscheme molokai
    " set background=dark

    " Remove toolbar
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t

    " Font
    " set guifont="DejaVu Sans Mono 10"
    set guifont=monoOne\ 9
endif

" Default to UTF8 encoding
set encoding=utf8

" Use Unix as the default file type
set ffs=unix,dos,mac

" Turn backups and swapfiles off, version control exists for that
set nobackup
set nowb
set noswapfile

" Disable highlighting with <leader>n
nmap <silent> <leader>n :nohlsearch<cr>

" Show whitespace with ,s
nmap <silent> <leader>s :set list!<cr>

" Change whitespace characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:$
