(import-macros {: color! : map!} :hibiscus.vim)
(import-macros {: lazy!} :lazy-macros)

;;; Defaults
(require :defaults)

;;; Mappings
(if (not vim.g.vscode)
  (require :mappings))

;;; Search
(require :search)

(if (not vim.g.vscode)
  (lazy! [
     ;; Fennel setup
     [:udayvir-singh/hibiscus.nvim]
     [:udayvir-singh/tangerine.nvim]

     ;; Colorscheme
     [:folke/tokyonight.nvim
       :lazy false
       :priority 1000
       :config (fn []
                 (let [theme (require :tokyonight)] (theme.setup {}))
                 (color! :tokyonight-storm))]

     ;; Syntax
     [:NoahTheDuke/vim-just
       :ft :just]
     [:tridactyl/vim-tridactyl
       :ft :tridactyl]
     [:nvim-treesitter/nvim-treesitter
       :dependencies [:windwp/nvim-ts-autotag]
       :build #(vim.cmd :TSUpdateSync)
       :config #(require :plugin/treesitter)]
     [:AckslD/nvim-FeMaco.lua
       :main :femaco
       :opts {}
       :event :VeryLazy]

     ;; UI and layout management
     [:mrjones2014/smart-splits.nvim
       :config #(require :plugin/smart-splits)
       :event :VeryLazy]
     [:nvim-lualine/lualine.nvim
       :dependencies [:nvim-tree/nvim-web-devicons]
       :config #(require :plugin/statusline)]
     [:stevearc/dressing.nvim
       :opts {}]
     [:folke/zen-mode.nvim
       :dependencies [:folke/twilight.nvim]
       :opts {}
       :cmd [:ZenMode]]


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
       :keys [[:<leader>= #(let [conform (require :conform)]
                             (conform.format {:async true :lsp_fallback true}))]]]

     ;; Completion
     [:L3MON4D3/LuaSnip
       :lazy true
       :build "make install_jsregexp"
       :dependencies [:rafamadriz/friendly-snippets]
       :config #(let [loader (require "luasnip.loaders.from_vscode")] (loader.lazy_load))]
     [:hrsh7th/nvim-cmp
       :dependencies [:hrsh7th/cmp-nvim-lsp
                       :hrsh7th/cmp-buffer
                       :hrsh7th/cmp-path
                       :hrsh7th/cmp-cmdline
                       :onsails/lspkind.nvim
                       :saadparwaiz1/cmp_luasnip 
                       :L3MON4D3/LuaSnip]
       :config #(require :plugin/completion)
       :event [:InsertEnter :CmdlineEnter]]

     ;; Mini.vim
     [:echasnovski/mini.nvim
       :config #(require :plugin/mini)]

     ;; Selectors
     [:folke/trouble.nvim
       :dependencies [:kyazdani42/nvim-web-devicons]
       :opts {}
       :cmd :Trouble]
     [:folke/todo-comments.nvim
       :cmd :TodoTrouble]
     [:nvim-telescope/telescope.nvim
       :dependencies [:folke/trouble.nvim
                       :debugloop/telescope-undo.nvim
                       :nvim-telescope/telescope-fzy-native.nvim
                       :dawsers/telescope-file-history.nvim]
       :keys [[:U "<cmd>Telescope undo<cr>" :<leader>. :<leader>ff :<leader>fg]]
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
       :event :VeryLazy
       :config #(map! [n] :<leader>g :<cmd>LazyGit<cr>)]

     ;; Project env
     [:ahmedkhalf/project.nvim
       :main :project_nvim
       :opts {:detection_methods [:pattern]}]

     ;; Markdown
     [:toppair/peek.nvim
       :cmd [:PeekOpen :PeekClose]
       :build  "deno task --quiet build:fast"
       :config #(let [peek (require :peek)]
                  (vim.api.nvim_create_user_command :PeekOpen peek.open {})
                  (vim.api.nvim_create_user_command :PeekClose peek.close {}))]

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
     ]
     {:defaults {:lazy false}
    :install {:colorscheme [:tokyonight-storm]}
    :performance {:reset_packpath false}})
  (lazy!
    [
     ;; Mini.vim
     [:echasnovski/mini.nvim :config #(require :plugin/mini)]

     ;; Search and Replace
     [:bronson/vim-visual-star-search]

     ;; Markdown
     [:toppair/peek.nvim
       :cmd [:PeekOpen :PeekClose]
       :build  "deno task --quiet build:fast"
       :config #(let [peek (require :peek)]
                  (vim.api.nvim_create_user_command :PeekOpen peek.open {})
                  (vim.api.nvim_create_user_command :PeekClose peek.close {}))]

     ;; Misc
     [:terryma/vim-expand-region
       :config #(require :plugin/expand-region)]
     [:tpope/vim-eunuch]
     [:tpope/vim-repeat]
     ] {:defaults {:lazy false}
    :install {:colorscheme [:tokyonight-storm]}
    :performance {:reset_packpath false}}))


{}
