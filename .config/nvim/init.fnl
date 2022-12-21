(import-macros {: g! : color!} :hibiscus.vim)

(macro paq! [input]
  (fn split-pkgs-and-configs [input]
    (local configs [])
    (local pkgs {})
    (each [_ [name & opts] (ipairs input)]
      (local pkg {})
      (for [i 1 (- (length opts) 1) 2]
        (let [k (. opts i)
              v (. opts (+ i 1))]
          (match k
            :config (table.insert configs v)
            :requires (each [_ rname (ipairs v)]
                        (tset pkgs rname {}))
            _ (tset pkg k v))))
      ; (table.insert pkgs pkg)
      (tset pkgs name pkg))
    (local cpkgs [])
    (each [name pkg (pairs pkgs)]
      (tset pkg 1 name)
      (table.insert cpkgs pkg))
    [cpkgs configs])
  (local [pkgs configs] (split-pkgs-and-configs input))
  `(do 
     ((require :paq) ,pkgs)
     (each [_# config# (ipairs ,configs)]
       (config#))))


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
    :requires [:neovim/nvim-lspconfig
               :williamboman/mason.nvim
               :williamboman/mason-lspconfig.nvim
               :b0o/schemastore.nvim
               :jose-elias-alvarez/null-ls.nvim
               :nvim-lua/plenary.nvim
               :simrat39/rust-tools.nvim]
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
])
