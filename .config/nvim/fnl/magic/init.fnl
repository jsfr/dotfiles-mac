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

  ;; Configure neovim
  :wbthomason/packer.nvim {}
  :Olical/aniseed {}
  :svermeulen/vimpeccable {:as :vimp}

  ;; REPL for Lisp (e.g. Fennel)
  :Olical/conjure {}
 
  ;; Tmux
  :numToStr/Navigator.nvim {:config (plugin.req :navigator)}
 
  ;; Linting, Completion
  :hrsh7th/nvim-compe {:config (plugin.req :completion)}
  :tami5/compe-conjure {}
  :neovim/nvim-lspconfig {}
  :kabouzeid/nvim-lspinstall {:config (plugin.req :lspinstall)}
  :hrsh7th/vim-vsnip {}
  :rafamadriz/friendly-snippets {}

  ;; Formatting
  :mhartington/formatter.nvim {:config (plugin.req :format)}

  ;; Documentation generation
  :kkoomen/vim-doge {:run ":call :doge#install"
                     :config (plugin.req :doge)}
 
  ;; Selectors
  :junegunn/fzf.vim {:requires :junegunn/fzf
                     :run ":call :fzf#install"}
 
  ;; Misc
  :lewis6991/gitsigns.nvim {:requires :nvim-lua/plenary.nvim
                            :config (plugin.req :gitsigns)}
  :dbakker/vim-projectroot {:config (plugin.req :projectroot)}
  :direnv/direnv.vim {}
  :editorconfig/editorconfig-vim {}
  :haya14busa/incsearch.vim {:config (plugin.req :incsearch)}
  :itchyny/lightline.vim {:requires :josa42/nvim-lightline-lsp
                          :config (plugin.req :statusline)}
  :windwp/nvim-autopairs {:config (plugin.req :auto-pairs)}
  :justinmk/vim-dirvish {:config (plugin.req :dirvish)}
  :mbbill/undotree {:keys [:U]
                    :config (plugin.req :undotree)}
  :mhinz/vim-startify {}
  :rhysd/clever-f.vim {:config (plugin.req :clever-f)}
  :terryma/vim-expand-region {:config (plugin.req :expand-region)}
  :liuchengxu/vim-better-default {:config (plugin.req :better-default)}
  :tpope/vim-abolish {:cmd [:Subvert :Abolish]}
  :tpope/vim-commentary {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :knsh14/vim-github-link {}
  )

;; Mappings
(require :magic.mappings)
