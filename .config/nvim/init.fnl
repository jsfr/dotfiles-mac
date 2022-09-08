(import-macros {: g! : color!} :hibiscus.vim)

;;; Defaults
(require :defaults)

;;; Mappings
(require :mappings)

(require-macros :hibiscus.packer)
(packer-setup)
(packer
  ;; Self-manage tangerine, hibiscus and impatient
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim)
  (use! :lewis6991/impatient.nvim)

  ;; Set a theme
  (use! :rebelot/kanagawa.nvim
        :config #(color! :kanagawa))

  ;; Syntax
  (use! :NoahTheDuke/vim-just)
  (use! :tridactyl/vim-tridactyl)
  (use! :nvim-treesitter/nvim-treesitter
        :requires [:IndianBoy42/tree-sitter-just]
        :run ":TSUpdateSync"
        :module :plugin/treesitter)

  ;; Tmux
  (use! :numToStr/Navigator.nvim 
        :module :plugin/tmux)

  ;; LSP
  (use! :junnplus/lsp-setup.nvim
        :requires [:neovim/nvim-lspconfig
                   :williamboman/mason.nvim
                   :williamboman/mason-lspconfig.nvim]
        :module :plugin/lsp)

  ;; Snippets
  (use! :hrsh7th/vim-vsnip
        :requires [:rafamadriz/friendly-snippets])

  ;; Completion
  (use! :Olical/conjure)
  (use! :hrsh7th/nvim-cmp
        :requires [:hrsh7th/cmp-nvim-lsp
                   :hrsh7th/cmp-buffer
                   :hrsh7th/cmp-path
                   :hrsh7th/cmp-vsnip
                   :Olical/conjure
                   :PaterJason/cmp-conjure]
        :module :plugin/completion)

  ;; Mini.vim
  (use! :echasnovski/mini.nvim
        :module :plugin/mini)

  ;; Formatting
  (use! :mhartington/formatter.nvim 
        :module :plugin/format)

  ;; Selectors
  (use! :ibhagwan/fzf-lua
        :module :plugin/selector)

  ;; Search and Replace
  (use! :windwp/nvim-spectre
        :requires :nvim-lua/plenary.nvim
        :module :plugin/search-replace)
  (use! :bronson/vim-visual-star-search)
  (use! :tpope/vim-abolish
        :cmd [:Subvert :Abolish])
  (use! :kevinhwang91/nvim-hlslens
        :config #(let [pkg (require :hlslens)] (pkg.setup {:calm_down true :nearest_only true})))
  (use :dyng/ctrlsf.vim)

  ;; File explorer
  (use! :tamago324/lir.nvim 
        :requires [:nvim-lua/plenary.nvim]
        :module :plugin/file-explorer)

  ;; Git
  (use! :lewis6991/gitsigns.nvim
        :requires :nvim-lua/plenary.nvim 
        :module :plugin/gitsigns)
  (use! :ruifm/gitlinker.nvim
        :config #(let [pkg (require :gitlinker)] (pkg.setup)))

  ;; Project env
  (use! :ahmedkhalf/project.nvim
        :config #(let [pkg (require :project_nvim)] (pkg.setup {})))
  (use! :editorconfig/editorconfig-vim)
  (use! :direnv/direnv.vim)

  ;; Misc
  (use! :itchyny/lightline.vim
        :requires :josa42/nvim-lightline-lsp
        :module :plugin/statusline)
  (use! :mbbill/undotree
        :keys [:U]
        :module :plugin/undotree)
  (use! :terryma/vim-expand-region
        :module :plugin/expand-region)
  (use! :tpope/vim-eunuch)
  (use! :tpope/vim-repeat)
  ; (use! :tpope/vim-sleuth)
  (use! :nmac427/guess-indent.nvim
        :config #(let [pkg (require :guess-indent)] (pkg.setup)))
  (use! :luukvbaal/stabilize.nvim
        :config #(let [pkg (require :stabilize)] (pkg.setup)))
  )
