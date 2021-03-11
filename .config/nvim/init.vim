" install vim-plug if it is missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Theming
Plug 'junegunn/seoul256.vim'

" Misc
Plug 'Yilin-Yang/vim-markbar'
Plug 'airblade/vim-gitgutter'
Plug 'dbakker/vim-projectroot'
Plug 'direnv/direnv.vim'
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-startify'
Plug 'rhysd/clever-f.vim'
Plug 'terryma/vim-expand-region'
Plug 'tommcdo/vim-lion'
Plug 'haya14busa/incsearch.vim'
Plug 'knsh14/vim-github-link'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Lightline
Plug 'itchyny/lightline.vim'

" tpope awesomeness
Plug 'tpope/vim-abolish', { 'on': ['Subvert', 'Abolish'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-jdaddy'

" Linting and Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" 70+ syntax plugs
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vito-c/jq.vim'
call plug#end()

let mapleader = " "

source ~/.config/nvim/settings.vim
source ~/.config/nvim/project.vim
source ~/.config/nvim/undotree.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/folds.vim
source ~/.config/nvim/search.vim
