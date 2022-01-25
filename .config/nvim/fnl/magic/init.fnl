(module magic.init
  {autoload {plugin magic.plugin
             defaults magic.defaults
             mappings magic.mappings
             nvim aniseed.nvim}})

;;; Defaults
(defaults.setup)

;;; Mappings
(mappings.setup)

;;; Plugins
(plugin.use
  ;; Set a theme
  :rebelot/kanagawa.nvim {:mod :color-scheme}

  ;; Syntax
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdateSync"
                                    :mod :treesitter}
  :NoahTheDuke/vim-just {:ft [:just]}

  ;; Configure neovim
  :wbthomason/packer.nvim {}
  :Olical/aniseed {}
  :svermeulen/vimpeccable {:as :vimp}
  :Olical/conjure {:ft [:fennel]}

  ;; Tmux
  :numToStr/Navigator.nvim {:mod :tmux}

  ;; LSP
  :williamboman/nvim-lsp-installer {:requires :neovim/nvim-lspconfig
                                    :mod :lsp}

  ;; Snippets
  :hrsh7th/vim-vsnip {:requires :rafamadriz/friendly-snippets}

  ;; Completion
  :hrsh7th/nvim-cmp {:requires [[:hrsh7th/cmp-nvim-lsp]
                                [:hrsh7th/cmp-buffer]
                                [:hrsh7th/cmp-path]
                                [:hrsh7th/cmp-vsnip]]
                     :mod :completion}

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
  :kevinhwang91/nvim-hlslens {:mod :search}
  :itchyny/lightline.vim {:requires :josa42/nvim-lightline-lsp
                          :mod :statusline}
  :tamago324/lir.nvim {:mod :file-explorer}
  :mbbill/undotree {:keys [:U]
                    :config (plugin.req :undotree)}
  :terryma/vim-expand-region {:mod :expand-region}
  :tpope/vim-abolish {:cmd [:Subvert :Abolish]}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sleuth {}
  :tpope/vim-jdaddy {}
  :ruifm/gitlinker.nvim {:mod :gitlinker}
  :folke/todo-comments.nvim {:requires :nvim-lua/plenary.nvim
                             :mod :todo-comments}
  :chentau/marks.nvim {:mod :marks}
  :dkarter/bullets.vim {}
  )
