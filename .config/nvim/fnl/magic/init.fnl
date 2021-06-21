(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim
             vimp vimp}})

;;; Mappings

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Map semicolon to colon (access to ex-mode)
(vimp.nnoremap ";" ":")
(vimp.vnoremap ";" ":")

;; jj escape sequence
(vimp.inoremap :jj :<esc>)
(vimp.cnoremap :jj :<c-c>)
(vimp.tnoremap :jj :<c-\><c-n>)

;; Spacemacs inspired keybings
(vimp.nnoremap :<leader>w= :<C-W>=)
[vimp.nnoremap :<leader>wq :<C-w>q]
(vimp.nnoremap :<leader>wc :<C-w>q)
(vimp.nnoremap :<leader>wd :<C-w>q)
(vimp.nnoremap :<leader>w/ :<Cmd>vsplit<cr>)
(vimp.nnoremap :<leader>w- :<Cmd>split<cr>)
(vimp.nnoremap :<leader>w\| :<C-W>\|)
(vimp.nnoremap :<leader>w_ :<C-W>_)
(vimp.nnoremap :<leader>f :<Cmd>Files<cr>)
(vimp.nnoremap :<leader>p :<Cmd>GFiles<cr>)
(vimp.nnoremap :<leader>g :<Cmd>GFiles?<cr>)
(vimp.nnoremap :<leader>d :<Cmd>bd<CR>)
(vimp.nnoremap :<leader>b :<Cmd>Buffers<cr>)
(vimp.nnoremap "<leader>," "<Cmd>Dirvish $MYVIMRC<cr>")

;; Indent entire buffer
(vimp.nnoremap :<leader>= "mzgg=G`z")

;; search for current highlight
(vimp.vnoremap :\ :yq/p<cr>N)

;; Tab to go to last active buffer
(defn mru-buffer []
  (-> :#
      (vim.fn.bufnr)
      (vim.fn.buflisted)
      (= 1)
      (if
        (vim.cmd "b #")
        (vim.cmd "bprev"))))
(vimp.nnoremap :<tab> mru-buffer)

;;; Plugins

(plugin.use
  ;; Set a theme
  :npxbr/gruvbox.nvim {:requires :rktjmp/lush.nvim
                       :config (plugin.req :color-scheme)}

  ;; Syntax
  :nvim-treesitter/nvim-treesitter {:run #((nvim.ex.TSUpdate))
                                    :config (plugin.req :treesitter)}

  ;; Configure neovim
  :wbthomason/packer.nvim {}
  :Olical/aniseed {}
  :svermeulen/vimpeccable {:as :vimp}

  ;; REPL for Lisp (e.g. Fennel)
  :Olical/conjure {}

  ;; Tmux
  :christoomey/vim-tmux-navigator {}
  :tmux-plugins/vim-tmux-focus-events {}

  ;; Linting and Completion
  :hrsh7th/nvim-compe {:config (plugin.req :completion)}
  :tami5/compe-conjure {}
  :neovim/nvim-lspconfig {}
  :kabouzeid/nvim-lspinstall {:config (plugin.req :lspinstall)}

  ;; Misc
  :lewis6991/gitsigns.nvim {:requires :nvim-lua/plenary.nvim
                            :config (plugin.req :gitsigns)}
  :dbakker/vim-projectroot {:config (plugin.req :projectroot)}
  :direnv/direnv.vim {}
  :editorconfig/editorconfig-vim {}
  :haya14busa/incsearch.vim {:config (plugin.req :incsearch)}
  :itchyny/lightline.vim {:requires :josa42/nvim-lightline-lsp
                          :config (plugin.req :statusline)}
  :windwp/nvim-autopairs {:config (plugin.req :auto-pairs)}
  :junegunn/fzf.vim {:requires :junegunn/fzf
                     :run (. vim.fn :fzf#install)
                     :config (plugin.req :fzf)}
  :justinmk/vim-dirvish {:config (plugin.req :dirvish)}
  :mbbill/undotree {:keys [:U]
                    :config (plugin.req :undotree)}
  :mhinz/vim-startify {}
  :rhysd/clever-f.vim {:config (plugin.req :clever-f)}
  :terryma/vim-expand-region {:config (plugin.req :expand-region)}
  :liuchengxu/vim-better-default {:config (plugin.req :better-default)}
  :tpope/vim-abolish {:cmd [:Subvert :Abolish]}
  :tpope/vim-commentary {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  )
