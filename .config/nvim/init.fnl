(import-macros {: g! : color!} :hibiscus.vim)

;;; Defaults
(require :defaults)

;;; Mappings
(require :mappings)

(local lazy (require :lazy))
(lazy.setup
 [
  ;; Fennel setup
  [:udayvir-singh/tangerine.nvim]
  [:udayvir-singh/hibiscus.nvim]

  ;; Colorscheme
  {1 :rebelot/kanagawa.nvim
   :lazy false
   :priority 1000
   :config #(color! :kanagawa)}

  ;; Syntax
  [:tridactyl/vim-tridactyl]
  {1 :bakpakin/fennel.vim
   :ft :fennel}
  {1 :nvim-treesitter/nvim-treesitter
   :dependencies [{1 :IndianBoy42/tree-sitter-just
                   :ft :just}]
   :build #(vim.cmd :TSUpdateSync)
   :config #(require :plugin/treesitter)}

  ;; Tmux
  {1 :numToStr/Navigator.nvim 
   :config #(require :plugin/tmux)}

  ;; UI
  {1 :itchyny/lightline.vim
   :dependencies [:josa42/nvim-lightline-lsp]
   :config #(require :plugin/statusline)}
  {1 :gelguy/wilder.nvim
   :config #(require :plugin/cmdline)}
  [:stevearc/dressing.nvim]
  

  ;; LSP and Formatting
  {1 :junnplus/lsp-setup.nvim
   :dependencies [:b0o/schemastore.nvim
                  :jose-elias-alvarez/null-ls.nvim
                  :neovim/nvim-lspconfig
                  :nvim-lua/plenary.nvim
                  :poljar/typos.nvim
                  :simrat39/rust-tools.nvim
                  :williamboman/mason-lspconfig.nvim
                  :williamboman/mason.nvim]
   :config #(require :plugin/lsp)}

  ;; Snippets
  {1 :hrsh7th/vim-vsnip
   :dependencies [:rafamadriz/friendly-snippets]}

  ;; Completion
  {1 :hrsh7th/nvim-cmp
   :dependencies [:hrsh7th/cmp-nvim-lsp
                  :hrsh7th/cmp-buffer
                  :hrsh7th/cmp-path
                  :hrsh7th/cmp-vsnip
                  ]
   :config #(require :plugin/completion)}

  ;; Mini.vim
  {1 :echasnovski/mini.nvim
   :config #(require :plugin/mini)}

  ;; Selectors
  {1 :ibhagwan/fzf-lua
   :config #(require :plugin/selector)}

  ;; Search and Replace
  {1 :windwp/nvim-spectre
   :dependencies [:nvim-lua/plenary.nvim]
   :config #(require :plugin/search-replace)}
  [:bronson/vim-visual-star-search]
  [:tpope/vim-abolish]

  ;; Git
  {1 :lewis6991/gitsigns.nvim
   :dependencies [:nvim-lua/plenary.nvim] 
   :config #(require :plugin/gitsigns)}
  [:ruifm/gitlinker.nvim]

  ;; Project env
  {1 :ahmedkhalf/project.nvim
   :main :project_nvim}
  [:editorconfig/editorconfig-vim]
  [:direnv/direnv.vim]

  ;; Misc
  [:mong8se/actually.nvim]
  {1 :mbbill/undotree
   :config #(require :plugin/undotree)}
  {1 :terryma/vim-expand-region
   :config #(require :plugin/expand-region)}
  [:tpope/vim-eunuch]
  [:tpope/vim-repeat]
  [:nmac427/guess-indent.nvim]
  [:luukvbaal/stabilize.nvim]
  {1 :anuvyklack/pretty-fold.nvim
   :config #(require :plugin/fold)}
  {1 :folke/trouble.nvim
   :dependencies [:kyazdani42/nvim-web-devicons]}
  [:folke/todo-comments.nvim]
  [:gennaro-tedesco/nvim-jqx]
] {:performance {:reset_packpath false}})

{}
