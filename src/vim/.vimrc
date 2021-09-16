" ------------------------------------------------------------------------------
" ~/.vimrc

syntax on

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

" ------------------------------------------------------------------------------

set wildmenu
set wildmode=full
set wildignore+=*.aux,*.log,*.class,*.o,*.obj

" ------------------------------------------------------------------------------

set showbreak=+
set listchars=tab:▸\ ,nbsp:·,eol:¬

" ------------------------------------------------------------------------------

set modeline
set modelines=2

" ------------------------------------------------------------------------------

set visualbell          " Use visual bell (no beeping)

" ------------------------------------------------------------------------------

set mousehide
