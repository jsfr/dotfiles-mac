(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim}})

;;; Plugins

(plugin.use
  ;; Set a theme
  :npxbr/gruvbox.nvim {:requires :rktjmp/lush.nvim
                       :config (plugin.req :color-scheme)}

  ;; Syntax
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdateSync"
                                    :config (plugin.req :treesitter)}
  :NoahTheDuke/vim-just {}
  :zah/nim.vim {}

  ;; Configure neovim
  :wbthomason/packer.nvim {}
  :Olical/aniseed {}
  :svermeulen/vimpeccable {:as :vimp}

  ;; REPL for Lisp (e.g. Fennel)
  :Olical/conjure {}
 
  ;; Tmux
  :numToStr/Navigator.nvim {:config (plugin.req :navigator)}

  ;; LSP
  :williamboman/nvim-lsp-installer {:requires :neovim/nvim-lspconfig
                                    :config (plugin.req :lsp)}

  ;; Snippets
  :hrsh7th/vim-vsnip {}
  :rafamadriz/friendly-snippets {}
 
  ;; Completion
  :hrsh7th/cmp-vsnip {}
  :hrsh7th/cmp-nvim-lsp {}
  :PaterJason/cmp-conjure {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/nvim-cmp {:config (plugin.req :completion)}

  ;; Mini.vim
  :echasnovski/mini.nvim {:config (plugin.req :mini)}

  ;; Formatting
  :mhartington/formatter.nvim {:config (plugin.req :format)}

  ;; Selectors
  :junegunn/fzf.vim {:requires :junegunn/fzf
                     :run ":call fzf#install()"}

  ;; Misc
  :lewis6991/gitsigns.nvim {:requires :nvim-lua/plenary.nvim
                            :config (plugin.req :gitsigns)}
  :dbakker/vim-projectroot {:config (plugin.req :projectroot)}
  :direnv/direnv.vim {}
  :editorconfig/editorconfig-vim {}
  :haya14busa/incsearch.vim {:config (plugin.req :incsearch)}
  :itchyny/lightline.vim {:requires :josa42/nvim-lightline-lsp
                          :config (plugin.req :statusline)}
  :justinmk/vim-dirvish {:config (plugin.req :dirvish)}
  :mbbill/undotree {:keys [:U]
                    :config (plugin.req :undotree)}
  :mhinz/vim-startify {}
  :terryma/vim-expand-region {:config (plugin.req :expand-region)}
  :liuchengxu/vim-better-default {:config (plugin.req :better-default)}
  :tpope/vim-abolish {:cmd [:Subvert :Abolish]}
  :tpope/vim-eunuch {}
  :tpope/vim-surround {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sleuth {}
  :tpope/vim-unimpaired {}
  :tpope/vim-jdaddy {}
  :knsh14/vim-github-link {}
  :folke/todo-comments.nvim {:requires :nvim-lua/plenary.nvim
                             :config (plugin.req :todo-comments)}
  :beauwilliams/focus.nvim {:config (plugin.req :focus)}
  )

;; Mappings
(require :magic.mappings)
