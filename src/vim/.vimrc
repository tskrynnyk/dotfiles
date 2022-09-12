" ------------------------------------------------------------------------------
" ~/.vimrc

set nocompatible

syntax on

language messages C

set background=dark

"set shortmess=atI
set shortmess+=a        " a - filmnrwx flags
set shortmess+=t        " t - truncate file names
set shortmess+=I        " I - no intro message when starting vim fileless

set lazyredraw          " Don't update the display while executing macros

set autowrite           " Autowrite the contents of the file when changing buffers

set formatoptions+=1    " Don't wrap before a one-letter word.
set formatoptions+=j    " Delete comment characters when joining lines

" ------------------------------------------------------------------------------

set number              " Show line numbers
set numberwidth=4
set relativenumber

" ------------------------------------------------------------------------------

set expandtab           " Use spaces instead of tabs
set autoindent          " Auto-indent new lines
set shiftwidth=4        " Number of auto-indent spaces
set smartindent         " Enable smart-indent
set smarttab            " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab
set tabstop=4
set shiftround          " When shifting lines, round the indentation to 
                        " the nearest multiple of `shiftwidth`

" ------------------------------------------------------------------------------

set wrap                " Wrap lines longer than screen width
set wrapmargin=8

" ------------------------------------------------------------------------------

set wildmenu
set wildmode=full
set wildignore+=*.aux,*.log,*.class,*.o,*.obj

" ------------------------------------------------------------------------------

set display+=lastline   " Always try to show a paragraph’s last line
set linebreak           " Avoid wrapping a line in the middle of a word
set scrolloff=2         " Scroll context
set sidescrolloff=2     " Horizontally
set showbreak=+
set listchars=tab:▸\ ,nbsp:·,eol:¬

" ------------------------------------------------------------------------------

set modeline
set modelines=2

" ------------------------------------------------------------------------------

set visualbell

" ------------------------------------------------------------------------------

set mousehide

"set cursorline

" ------------------------------------------------------------------------------

set timeoutlen=300      " Mapping timeout
set ttimeoutlen=50      " Keycode timeout

set history=500         " Number of command lines to remember

set viminfo=%,<800,'25,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" ------------------------------------------------------------------------------

let cache_dir = $HOME . '/.cache/vim'
if !isdirectory(cache_dir)
    call mkdir(cache_dir)
endif

" ------------------------------------------------------------------------------

set backupdir=~/.cache/vim  " Directory to store backup files

set dir=~/.cache/vim        " Directory to store swap files

set viminfofile=~/.cache/viminfo

set tags=.tags

let g:netrw_home   = '~/.cache/vim'
let g:netrw_banner = 0

" ------------------------------------------------------------------------------

filetype plugin indent on

autocmd FileType make setlocal noexpandtab

" ------------------------------------------------------------------------------

colorscheme elflord

" ------------------------------------------------------------------------------

"let my_config = $HOME . '/.vim/vimrc.local'
if filereadable($HOME . '/.vim/vimrc.local')
    source ~/.vim/vimrc.local
endif

