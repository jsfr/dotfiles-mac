" Theme
syntax enable
" colorscheme OceanicNext
let g:seoul256_background = 236
colorscheme seoul256
if (has("termguicolors"))
 set termguicolors
endif

set breakindent
set clipboard^=unnamedplus " System clipboard
" set colorcolumn=100
set cursorline
set display+=lastline      " Show latest command/pressed keys (i think)
set expandtab              " Insert spaces when TAB is pressed.
set formatoptions+=o       " Continue comment marker in new lines.
set gdefault               " Use 'g' flag by default with :s/foo/bar/.
set hidden                 " Don't unload buffers when they are abandoned
set hlsearch               " Highlight search results.
set ignorecase             " Make searching case insensitive
set incsearch              " Incremental search.
set laststatus=2
set linespace=0            " Set line-spacing to minimum.
set list                   " Show problematic characters.
set magic                  " Use 'magic' patterns (extended regular expressions).
set modeline               " Enable modeline.
set mouse=a                " Enable mouse support in all modes
set noerrorbells           " No beeps.
set nojoinspaces           " Prevents inserting two spaces after punctuation on a join (J)
set nostartofline          " Do not jump to first character with page commands.
set notimeout
set number                 " Show the line numbers on the left side.
set relativenumber
set ruler                  " Show the line and column numbers of the cursor.
set scrolloff=10           " Show next 10 lines while scrolling.
set shell=/bin/bash        " Set shell to bash to kill https://github.com/tpope/vim-pathogen/issues/105
set showbreak=↳\_
set showcmd                " Show (partial) command in status line.
set showmatch              " Show matching brackets.
set showmode               " Show current mode.
set sidescrolloff=10       " Show next 10 columns while side-scrolling.
set smartcase              " ... unless the query has capital letters.
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
set spelllang=en
set splitbelow             " Horizontal split below current.
set splitright             " Vertical split to right of current.
set textwidth=0            " Hard-wrap long lines as you type them.
set timeoutlen=350         " Shorter timeout length

autocmd InsertEnter * set timeout   " Enable timeout in insert
autocmd InsertLeave * set notimeout " Disable timeout in other modes

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
augroup ft_go
    au!
    au Filetype go setlocal listchars+=tab:\ \ 
augroup END

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='trash'
let g:netrw_altfile=1

" Sort folders before files
let g:dirvish_mode = ':sort ,^.*[\/],'
