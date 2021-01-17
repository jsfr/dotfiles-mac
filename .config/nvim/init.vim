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
Plug 'dyng/ctrlsf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itmammoth/doorboy.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Plug 'phux/vim-hardtime'
Plug 'rhysd/clever-f.vim'
Plug 'terryma/vim-expand-region'

" Misc
Plug 'justinmk/vim-dirvish'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'dbakker/vim-projectroot'
Plug 'mhinz/vim-startify'
" Plug 'eliba2/vim-node-inspect'
Plug 'direnv/direnv.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Markdown
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" Lightline
Plug 'itchyny/lightline.vim'
" Plug 'maximbaz/lightline-ale'

" tpope awesomeness
Plug 'tpope/vim-abolish'
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
" Plug 'desmap/ale-sensible' | Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 70+ syntax plugs
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vito-c/jq.vim'
" Plug 'glench/vim-jinja2-syntax'
" Plug 'amadeus/vim-mjml'
" Plug 'adimit/prolog.vim'
call plug#end()

let mapleader = " "

source ~/.config/nvim/settings.vim
source ~/.config/nvim/project.vim
" source ~/.config/nvim/ale.vim
source ~/.config/nvim/undotree.vim
" source ~/.config/nvim/hardtime.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/statusline.vim
" source ~/.config/nvim/goyo.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/folds.vim
