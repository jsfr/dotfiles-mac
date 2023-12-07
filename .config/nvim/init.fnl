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
  [:bakpakin/fennel.vim
   :ft :fennel]
  [:NoahTheDuke/vim-just
   :ft :just]
  [:nvim-treesitter/nvim-treesitter
   :build #(vim.cmd :TSUpdateSync)
   :config #(require :plugin/treesitter)]

  ;; Tmux
  [:mrjones2014/smart-splits.nvim
   :config #(require :plugin/smart-splits)
   :event :VeryLazy]

  ;; UI
  [:itchyny/lightline.vim
   :dependencies [:josa42/nvim-lightline-lsp]
   :config #(require :plugin/statusline)]
  [:gelguy/wilder.nvim
   :config #(require :plugin/cmdline)
   :event :VeryLazy]
  [:stevearc/dressing.nvim
   :opts {}]
  [:shortcuts/no-neck-pain.nvim
   :event :VeryLazy]
  
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
   :dependencies [:rafamadriz/friendly-snippets]
   :event :VeryLazy]

  ;; Completion
  [:hrsh7th/nvim-cmp
   :dependencies [:hrsh7th/cmp-nvim-lsp
                  :hrsh7th/cmp-buffer
                  :hrsh7th/cmp-path
                  :hrsh7th/cmp-vsnip]
   :config #(require :plugin/completion)
   :event :VeryLazy]

  ;; Mini.vim
  [:echasnovski/mini.nvim
   :config #(require :plugin/mini)]

  ;; Selectors
  [:ibhagwan/fzf-lua
   :config #(require :plugin/selector)
   :event :VeryLazy]

  ;; Search and Replace
  [:bronson/vim-visual-star-search
   :event :VeryLazy]

  ;; Git
  [:lewis6991/gitsigns.nvim
   :dependencies [:nvim-lua/plenary.nvim] 
   :config #(require :plugin/gitsigns)
   :event :VeryLazy]
  [:ruifm/gitlinker.nvim
   :dependencies [:nvim-lua/plenary.nvim]
   :main :gitlinker
   :opts {}
   :keys [:<space>gy]]
  [:kdheepak/lazygit.nvim
   :dependencies [:nvim-lua/plenary.nvim]
   :event :VeryLazy]

  ;; Project env
  [:ahmedkhalf/project.nvim
   :main :project_nvim
   :opts {}]
  [:editorconfig/editorconfig-vim]
  [:direnv/direnv.vim]

  ;; Misc
  [:rest-nvim/rest.nvim
   :dependencies [:nvim-lua/plenary.nvim]
   :ft [:http :json]
   :config #(require :plugin/rest-nvim)]
  [:Wansmer/treesj
   :dependencies [:nvim-treesitter/nvim-treesitter]
   :opts {}
   :keys [:<space>m :<space>j :<space>s]]
  [:mong8se/actually.nvim
   :lazy false
   :priority 1000]
  [:mbbill/undotree
   :config #(require :plugin/undotree)
   :keys [:U]]
  [:terryma/vim-expand-region
   :config #(require :plugin/expand-region)
   :keys [:v :<C-v>]]
  [:tpope/vim-eunuch
   :event :VeryLazy]
  [:tpope/vim-repeat
   :event :VeryLazy]
  [:nmac427/guess-indent.nvim
   :main :guess-indent
   :opts {}]
  [:anuvyklack/pretty-fold.nvim
   :main :pretty-fold
   :opts {}
   :event :VeryLazy]
  [:folke/trouble.nvim
   :dependencies [:kyazdani42/nvim-web-devicons]
   :event :VeryLazy]
  [:folke/todo-comments.nvim
   :event :VeryLazy]
  ; [:nathom/filetype.nvim
  ;  :opts {:overrides {:extensions {:tf :terraform
  ;                                  :tfvars :terraform
  ;                                  :tfstate :json}
  ;                     :function_extensions {:tf #(set vim.bo.commentstring "#%s")}}}
  ;  :main :filetype]
] {:defaults {:lazy false}
   :install {:colorscheme [:tokyonight-storm]}
   :performance {:reset_packpath false}})

{}
