(import-macros {: g! : color!} :hibiscus.vim)
(import-macros {: paq!} :paq-macros)

;;; Defaults
(require :defaults)

;;; Mappings
(require :mappings)

;;; Add packages
(paq!
 [
  ;; Self-manage tangerine, hibiscus, impatient and paq
  [:udayvir-singh/tangerine.nvim]
  [:udayvir-singh/hibiscus.nvim]
  [:lewis6991/impatient.nvim]
  [:savq/paq-nvim]

  ;; Set a theme
  [:rebelot/kanagawa.nvim
   :config #(color! :kanagawa)]

  ;; Syntax
  [:NoahTheDuke/vim-just]
  [:tridactyl/vim-tridactyl]
  [:bakpakin/fennel.vim]
  [:nvim-treesitter/nvim-treesitter
   :requires [:IndianBoy42/tree-sitter-just]
   :run #(vim.cmd :TSUpdateSync)
   :config #(require :plugin/treesitter)]
  [:https://github.com/koka-lang/koka
   :opt true
   :config #(vim.cmd "packadd koka/support/vim")]

  ;; Tmux
  [:numToStr/Navigator.nvim 
   :config #(require :plugin/tmux)]

  ;; UI
  [:itchyny/lightline.vim
   :requires [:josa42/nvim-lightline-lsp]
   :config #(require :plugin/statusline)]
  [:gelguy/wilder.nvim
   :config #(require :plugin/cmdline)]
  [:stevearc/dressing.nvim
   :config #(let [pkg (require :dressing)] (pkg.setup))]

  ;; LSP and Formatting
  [:junnplus/lsp-setup.nvim
   :requires [:b0o/schemastore.nvim
              :jose-elias-alvarez/null-ls.nvim
              :neovim/nvim-lspconfig
              :nvim-lua/plenary.nvim
              :poljar/typos.nvim
              :simrat39/rust-tools.nvim
              :williamboman/mason-lspconfig.nvim
              :williamboman/mason.nvim ]
   :config #(require :plugin/lsp)]

  ;; Snippets
  [:hrsh7th/vim-vsnip
   :requires [:rafamadriz/friendly-snippets]]

  ;; Completion
  [:Olical/conjure]
  [:hrsh7th/nvim-cmp
   :requires [:hrsh7th/cmp-nvim-lsp
              :hrsh7th/cmp-buffer
              :hrsh7th/cmp-path
              :hrsh7th/cmp-vsnip
              :Olical/conjure
              :PaterJason/cmp-conjure]
   :config #(require :plugin/completion)]

  ;; Mini.vim
  [:echasnovski/mini.nvim
   :config #(require :plugin/mini)]

  ;; Selectors
  [:ibhagwan/fzf-lua
   :config #(require :plugin/selector)]

  ;; Search and Replace
  [:windwp/nvim-spectre
   :requires [:nvim-lua/plenary.nvim]
   :config #(require :plugin/search-replace)]
  [:bronson/vim-visual-star-search]
  [:tpope/vim-abolish]
  [:dyng/ctrlsf.vim]

  ;; Git
  [:lewis6991/gitsigns.nvim
   :requires [:nvim-lua/plenary.nvim] 
   :config #(require :plugin/gitsigns)]
  [:ruifm/gitlinker.nvim
   :config #(let [pkg (require :gitlinker)] (pkg.setup))]

  ;; Project env
  [:ahmedkhalf/project.nvim
   :config #(let [pkg (require :project_nvim)] (pkg.setup {}))]
  [:editorconfig/editorconfig-vim]
  [:direnv/direnv.vim]

  ;; Misc
  [:mong8se/actually.nvim]
  [:vimwiki/vimwiki]
  [:mbbill/undotree
   :config #(require :plugin/undotree)]
  [:terryma/vim-expand-region
   :config #(require :plugin/expand-region)]
  [:tpope/vim-eunuch]
  [:tpope/vim-repeat]
  [:nmac427/guess-indent.nvim
   :config #(let [pkg (require :guess-indent)] (pkg.setup))]
  [:luukvbaal/stabilize.nvim
   :config #(let [pkg (require :stabilize)] (pkg.setup))]
  [:anuvyklack/pretty-fold.nvim
   :config #(require :plugin/fold)]
  [:folke/trouble.nvim
   :requires [:kyazdani42/nvim-web-devicons]
   :config #(let [pkg (require :trouble)] (pkg.setup))]
  [:folke/todo-comments.nvim
   :config #(let [pkg (require :todo-comments)] (pkg.setup))]
])

{}
