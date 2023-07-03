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
  [:folke/tokyonight.nvim
   :lazy false
   :priority 1000
   :config (fn []
             (local pkg (require :tokyonight))
             (pkg.setup {})
             (color! :tokyonight-storm))]

  ;; Syntax
  [:tridactyl/vim-tridactyl]
  [:bakpakin/fennel.vim
   :ft :fennel]
  [:nvim-treesitter/nvim-treesitter
   :dependencies [:IndianBoy42/tree-sitter-just]
   :build #(vim.cmd :TSUpdateSync)
   :config #(require :plugin/treesitter)]

  ;; Tmux
  [:mrjones2014/smart-splits.nvim
   :config #(require :plugin/smart-splits)]

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
                  :hrsh7th/cmp-vsnip]
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
   :main :project_nvim
   :opts {}]
  [:editorconfig/editorconfig-vim]
  [:direnv/direnv.vim]

  ;; Misc

  [:Wansmer/treesj
   :keys [:<space>m :<space>j :<space>s]
   :dependencies [:nvim-treesitter/nvim-treesitter]
   :opts {}]
  [:mong8se/actually.nvim
   :lazy false
   :priority 1000]
  [:mbbill/undotree
   :config #(require :plugin/undotree)]
  [:terryma/vim-expand-region
   :config #(require :plugin/expand-region)]
  [:tpope/vim-eunuch]
  [:tpope/vim-repeat]
  [:nmac427/guess-indent.nvim
   :main :guess-indent
   :opts {}]
  [:anuvyklack/pretty-fold.nvim
   :main :pretty-fold
   :opts {}
   :lazy true
   :event :VeryLazy]
  [:folke/trouble.nvim
   :dependencies [:kyazdani42/nvim-web-devicons]
   :lazy true
   :event :VeryLazy]
  [:folke/todo-comments.nvim
   :lazy true
   :event :VeryLazy]
] {:defaults {:lazy false}
   :install {:colorscheme [:kanagawa]}
   :performance {:reset_packpath false}})

{}
