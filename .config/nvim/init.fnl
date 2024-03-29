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
  [:tridactyl/vim-tridactyl
   :ft :tridactyl]
  [:nvim-treesitter/nvim-treesitter
   :dependencies [:windwp/nvim-ts-autotag]
   :build #(vim.cmd :TSUpdateSync)
   :config #(require :plugin/treesitter)]

  ;; UI and layout management
  [:mrjones2014/smart-splits.nvim
   :config #(require :plugin/smart-splits)
   :event :VeryLazy]
  [:nvim-lualine/lualine.nvim
   :dependencies [:nvim-tree/nvim-web-devicons]
   :config #(require :plugin/statusline)]
  [:stevearc/dressing.nvim
   :opts {}]
  [:shortcuts/no-neck-pain.nvim
   :event :VeryLazy]
  
  ;; LSP, lint and formatting
  [:williamboman/mason.nvim
   :name :mason
   :main :mason
   :opts {}]
  [:williamboman/mason-lspconfig.nvim
   :name :lsp
   :dependencies [:mason
                  :b0o/schemastore.nvim
                  :neovim/nvim-lspconfig
                  :nvim-lua/plenary.nvim]
   :config #(require :plugin/lsp)]
  [:rshkarin/mason-nvim-lint
   :dependencies [:mason
                  :mfussenegger/nvim-lint]
   :config #(require :plugin/lint)]
  [:mrcjkb/rustaceanvim
   :dependencies [:lsp]
   :version :^4
   :ft [:rust]]
  [:pmizio/typescript-tools.nvim
   :dependencies [:lsp
                  :dmmulroy/ts-error-translator.nvim
                  :nvim-lua/plenary.nvim
                  :neovim/nvim-lspconfig]
   :config #(require :plugin/typescript-tools)]
  [:stevearc/conform.nvim
   :config #(require :plugin/format)
   :cmd [:ConformInfo]
   :keys [[:<leader>= #(let [conform (require :conform)] (conform.format {:async true :lsp_fallback true}))]]]

  [:jay-babu/mason-nvim-dap.nvim
   :dependencies [:mfussenegger/nvim-dap
                  :nvim-neotest/nvim-nio
                  :rcarriga/nvim-dap-ui]
   :config #(require :plugin/dap)]

  ;; Snippets
  [:hrsh7th/vim-vsnip
   :dependencies [:rafamadriz/friendly-snippets]
   :event :VeryLazy]

  ;; Completion
  [:hrsh7th/nvim-cmp
   :dependencies [:hrsh7th/cmp-nvim-lsp
                  :hrsh7th/cmp-buffer
                  :hrsh7th/cmp-path
                  :hrsh7th/cmp-cmdline
                  :hrsh7th/cmp-vsnip
                  :onsails/lspkind.nvim]
   :config #(require :plugin/completion)
   :event [:InsertEnter :CmdlineEnter]]

  ;; Mini.vim
  [:echasnovski/mini.nvim
   :config #(require :plugin/mini)]

  ;; Selectors
  [:folke/trouble.nvim
   :dependencies [:kyazdani42/nvim-web-devicons]
   :event :VeryLazy]
  [:folke/todo-comments.nvim
   :event :VeryLazy]
  [:nvim-telescope/telescope.nvim
   :dependencies [:folke/trouble.nvim
                  :debugloop/telescope-undo.nvim
                  :nvim-telescope/telescope-fzy-native.nvim]
   :keys [[:U "<cmd>Telescope undo<cr>"]]
   :branch :0.1.x
   :event :VeryLazy
   :config #(require :plugin/telescope)]

  ;; Search and Replace
  [:bronson/vim-visual-star-search
   :event :VeryLazy]

  ;; Git
  [:lewis6991/gitsigns.nvim
   :dependencies [:nvim-lua/plenary.nvim] 
   :config #(require :plugin/gitsigns)
   :event :VeryLazy]
  [:linrongbin16/gitlinker.nvim
   :main :gitlinker
   :opts {}
   :event :VeryLazy]
  [:kdheepak/lazygit.nvim
   :dependencies [:nvim-lua/plenary.nvim]
   :event :VeryLazy]

  ;; Project env
  [:ahmedkhalf/project.nvim
   :main :project_nvim
   :opts {}]

  ;; Misc
  [:Wansmer/treesj
   :dependencies [:nvim-treesitter/nvim-treesitter]
   :opts {}
   :keys [:<space>m :<space>j :<space>s]]
  [:mong8se/actually.nvim
   :lazy false
   :priority 1000]
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
] {:defaults {:lazy false}
   :install {:colorscheme [:tokyonight-storm]}
   :performance {:reset_packpath false}})

{}
