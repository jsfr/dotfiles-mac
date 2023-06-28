(import-macros {: g! : color!} :hibiscus.vim)
(import-macros {: lazy!} :lazy-macros)

;;; Defaults
(require :defaults)

;;; Mappings
(require :mappings)

;;; Search
(require :search)

(lazy!
 [
  ;; Fennel setup
  [:udayvir-singh/hibiscus.nvim]
  [:udayvir-singh/tangerine.nvim]

  ;; Colorscheme
  [:rebelot/kanagawa.nvim
   :lazy false
   :priority 1000
   :config #(color! :kanagawa)]

  ;; Syntax
  [:tridactyl/vim-tridactyl]
  [:bakpakin/fennel.vim
   :ft :fennel]
  [:nvim-treesitter/nvim-treesitter
   :dependencies [{1 :IndianBoy42/tree-sitter-just
                   :ft :just}]
   :build #(vim.cmd :TSUpdateSync)
   :config #(require :plugin/treesitter)]

  ;; Tmux
  [:numToStr/Navigator.nvim 
   :config #(require :plugin/tmux)]

  ;; UI
  [:itchyny/lightline.vim
   :dependencies [:josa42/nvim-lightline-lsp]
   :config #(require :plugin/statusline)]
  [:gelguy/wilder.nvim
   :config #(require :plugin/cmdline)]
  [:stevearc/dressing.nvim]
  

  ;; LSP and Formatting
  [:junnplus/lsp-setup.nvim
   :dependencies [:b0o/schemastore.nvim
                  :jose-elias-alvarez/null-ls.nvim
                  :neovim/nvim-lspconfig
                  :nvim-lua/plenary.nvim
                  :poljar/typos.nvim
                  :simrat39/rust-tools.nvim
                  :williamboman/mason-lspconfig.nvim
                  :williamboman/mason.nvim]
   :config #(require :plugin/lsp)]

  ;; Snippets
  [:hrsh7th/vim-vsnip
   :dependencies [:rafamadriz/friendly-snippets]]

  ;; Completion
  [:hrsh7th/nvim-cmp
   :dependencies [:hrsh7th/cmp-nvim-lsp
                  :hrsh7th/cmp-buffer
                  :hrsh7th/cmp-path
                  :hrsh7th/cmp-vsnip
                  ]
   :config #(require :plugin/completion)]

  ;; Mini.vim
  [:echasnovski/mini.nvim
   :config #(require :plugin/mini)]

  ;; Selectors
  [:ibhagwan/fzf-lua
   :config #(require :plugin/selector)]

  ;; Search and Replace
  [:windwp/nvim-spectre
   :dependencies [:nvim-lua/plenary.nvim]
   :config #(require :plugin/search-replace)]
  [:bronson/vim-visual-star-search]
  [:tpope/vim-abolish]

  ;; Git
  [:lewis6991/gitsigns.nvim
   :dependencies [:nvim-lua/plenary.nvim] 
   :config #(require :plugin/gitsigns)]
  [:ruifm/gitlinker.nvim]
  [:kdheepak/lazygit.nvim
   :dependencies [:nvim-lua/plenary.nvim]]

  ;; Project env
  [:ahmedkhalf/project.nvim
   :main :project_nvim]
  [:editorconfig/editorconfig-vim]
  [:direnv/direnv.vim]

  ;; Misc
  [:mong8se/actually.nvim]
  [:mbbill/undotree
   :config #(require :plugin/undotree)]
  [:terryma/vim-expand-region
   :config #(require :plugin/expand-region)]
  [:tpope/vim-eunuch]
  [:tpope/vim-repeat]
  [:nmac427/guess-indent.nvim]
  [:luukvbaal/stabilize.nvim]
  [:anuvyklack/pretty-fold.nvim
   :config #(require :plugin/fold)]
  [:folke/trouble.nvim
   :dependencies [:kyazdani42/nvim-web-devicons]]
  [:folke/todo-comments.nvim]
  [:gennaro-tedesco/nvim-jqx]
] {:defaults {:lazy false}
   :install {:colorscheme [:kanagawa]}
   :performance {:reset_packpath false}})

{}
