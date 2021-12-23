(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim}})

;;; Plugins

(plugin.use
  ;; Set a theme
  :npxbr/gruvbox.nvim {:requires :rktjmp/lush.nvim
                       :mod :color-scheme}

  ;; Syntax
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdateSync"
                                    :mod :treesitter}

  ;; Configure neovim
  :wbthomason/packer.nvim {}
  :Olical/aniseed {}
  :svermeulen/vimpeccable {:as :vimp}
 
  ;; Tmux
  :numToStr/Navigator.nvim {:mod :navigator}

  ;; LSP
  :williamboman/nvim-lsp-installer {:requires :neovim/nvim-lspconfig
                                    :mod :lsp}

  ;; Completion
  :hrsh7th/cmp-vsnip {:requires [[:hrsh7th/vim-vsnip]
                                 [:rafamadriz/friendly-snippets]]}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:mod :completion}

  ;; Mini.vim
  :echasnovski/mini.nvim {:mod :mini}

  ;; Formatting
  :mhartington/formatter.nvim {:mod :format}

  ;; Selectors
  :mfussenegger/nvim-fzy {:mod :selector}

  ;; Distraction-free writing 
  :folke/zen-mode.nvim {:requires :folke/twilight.nvim
                        :mod :zen-mode}

  ;; Misc
  :lewis6991/gitsigns.nvim {:requires :nvim-lua/plenary.nvim
                            :mod :gitsigns}
  :dbakker/vim-projectroot {:mod :projectroot}
  :direnv/direnv.vim {}
  :editorconfig/editorconfig-vim {}
  :haya14busa/incsearch.vim {:mod :incsearch}
  :itchyny/lightline.vim {:requires :josa42/nvim-lightline-lsp
                          :mod :statusline}
  :justinmk/vim-dirvish {:mod :dirvish}
  :mbbill/undotree {:keys [:U]
                    :config (plugin.req :undotree)}
  :mhinz/vim-startify {}
  :terryma/vim-expand-region {:mod :expand-region}
  :liuchengxu/vim-better-default {:mod :better-default}
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
                             :mod :todo-comments}
  :beauwilliams/focus.nvim {:mod :focus}
  )

;; Mappings
(require :magic.mappings)
