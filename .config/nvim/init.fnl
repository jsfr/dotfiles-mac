(import-macros {: g!} :hibiscus.vim)

;;; Defaults
(require :defaults)

;;; Mappings
(require :mappings)

(require-macros :hibiscus.packer)
(packer-setup)
(packer
  ;; Self-manage tangerine and hibiscus
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim)

  ;; Set a theme
  (use! :rebelot/kanagawa.nvim
        :config #(vim.cmd "colorscheme kanagawa"))

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

  ;; Sexp
  (use! :tpope/vim-sexp-mappings-for-regular-people
        :requires [:guns/vim-sexp]
        :config #(g! sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))

  ;; Formatting
  (use! :mhartington/formatter.nvim 
        :module :plugin/format)

  ;; Selectors
  (use! :ibhagwan/fzf-lua
        :module :plugin/selector)

  ;; Misc
  (use! :lewis6991/gitsigns.nvim
        :requires :nvim-lua/plenary.nvim 
        :module :plugin/gitsigns)
  (use! :ahmedkhalf/project.nvim
        :config #(let [project-nvim (require :project_nvim)] (project-nvim.setup {})))
  (use! :direnv/direnv.vim)
  (use! :editorconfig/editorconfig-vim)
  (use! :kevinhwang91/nvim-hlslens
        :config #(let [hlslens (require :hlslens)] (hlslens.setup {:calm_down true
                                                                   :nearest_only true})))
  (use! :itchyny/lightline.vim
        :requires :josa42/nvim-lightline-lsp
        :module :plugin/statusline)
  (use! :mbbill/undotree
        :keys [:U]
        :module :plugin/undotree)
  (use! :terryma/vim-expand-region
        :module :plugin/expand-region)
  (use! :tpope/vim-abolish
        :cmd [:Subvert :Abolish])
  (use! :tpope/vim-eunuch)
  (use! :tpope/vim-fugitive)
  (use! :tpope/vim-repeat)
  (use! :tpope/vim-sleuth)
  (use! :ruifm/gitlinker.nvim
        :config #(let [gitlinker (require :gitlinker)] (gitlinker.setup)))
  (use! :bronson/vim-visual-star-search)
  (use! :windwp/nvim-spectre
        :requires :nvim-lua/plenary.nvim
        :module :plugin/search-replace)
  (use! :tamago324/lir.nvim 
        :requires [:nvim-lua/plenary.nvim]
        :module :plugin/file-explorer)
  )
