set nocompatible
filetype off


set rtp+=~/.vim/bundle/Vundle.vim

" Vundle plugins
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ledger/vim-ledger'
Plugin 'godlygeek/tabular'
Plugin 'sheerun/vim-polyglot'
Plugin 'dracula/vim'
Plugin 'junegunn/fzf.vim'
call vundle#end()
filetype plugin indent on

" Custom fzf installation
set rtp+=~/.fzf

" Increase history
set history=700

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Configure backspace so it acts normally
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use buffers
set hidden

" Relative numbering
set relativenumber

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
"set wrap " Wrap lines
set nowrap

" Settings for specific file types
autocmd FileType ruby,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType java,python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set some filetypes for rails
autocmd BufNewFile,BufRead *.handlebars,*.html.erb setlocal filetype=html

" ino files are C
autocmd BufNewFile,BufRead *.ino setlocal filetype=c

" Set 3 lines to the cursor when moving using j/k
set so=3

" Wild menu
set wildmenu
set wildmode=list:longest

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,node_modules/

" Search settings
set ignorecase
set smartcase
set hlsearch
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
  " Remove toolbar
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t

  " Font
  " set guifont="DejaVu Sans Mono 10"
  " set guifont=Inconsolata\ 10
  " set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 10
  set guifont=Roboto\ Mono\ for\ Powerline\ 12
endif

if has("termguicolors")
  set termguicolors

  if !empty("$TMUX")
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

" Theme
set background=dark
colorscheme dracula


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

set splitbelow
set splitright

" Change whitespace characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:$

" Increase size of status bar
set laststatus=2

" YouCompleteMe Settings
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Down>']

" UltiSnip Settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Airline Settings
let g:airline_theme = 'dracula'

" Use Ctrl-P for FZF
nnoremap <C-p> :Files<CR>
inoremap <C-p> <ESC>:Files<CR>
