(module magic.init
  {autoload {plugin magic.plugin
             m magic.mapping}})

;;; Mappings

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Map semicolon to colon (access to ex-mode)
(m.noremap :n ";" ":")
(m.noremap :v ";" ":")

;; jj escape sequence
(m.noremap :i :jj :<esc>)
(m.noremap :c :jj :<c-c>)
(m.noremap :t :jj :<c-\><c-n>)

;; Tab to go to last active buffer
(m.noremap :n :<tab> (.. ":call v:lua." (plugin.req :mru-buffer) "['mru-buffer']()<cr>"))

;; Spacemacs inspired keybings
(m.noremap :n :<leader>w= :<C-W>=)
[m.noremap :n :<leader>wq :<C-w>q]
(m.noremap :n :<leader>wc :<C-w>q)
(m.noremap :n :<leader>wd :<C-w>q)
(m.noremap :n :<leader>w/ ":vsplit<cr>")
(m.noremap :n :<leader>w- ":split<cr>")
(m.noremap :n :<leader>w\| :<C-W>\|)
(m.noremap :n :<leader>w_ :<C-W>_)
(m.noremap :n :<leader>f ":Files<cr>")
(m.noremap :n :<leader>p ":GFiles<cr>")
(m.noremap :n :<leader>g ":GFiles?<cr>")
(m.noremap :n :<leader>d ":bd<CR>")
(m.noremap :n :<leader>b ":Buffers<cr>")
(m.noremap :n "<leader>," ":Dirvish $MYVIMRC<cr>")

;; Indent entire buffer
(m.map "" :<leader>= "mzgg=G`z" {})

;; search for current highlight
(m.noremap :v "\\" "yq/p<CR>N")

; " make it easier to search with rg
; cnoreabbrev rg Rg

; " make it easier to save with git
; cnoreabbrev gw Gw

;;; Plugins

(plugin.use
  ;; Set a theme
  :npxbr/gruvbox.nvim {:requires :rktjmp/lush.nvim
                       :config (plugin.req :color-scheme)}

  ;; Syntax

  ;; Configure neovim
  :wbthomason/packer.nvim {}
  :Olical/aniseed {}

  ;; Tmux
  :christoomey/vim-tmux-navigator {}
  :tmux-plugins/vim-tmux-focus-events {}

  ;; Linting and Completion
  :hrsh7th/nvim-compe {}

  ;; Misc
  :lewis6991/gitsigns.nvim {:requires :nvim-lua/plenary.nvim
                            :config (plugin.req :gitsigns)}
  :dbakker/vim-projectroot {:config (plugin.req :projectroot)}
  :direnv/direnv.vim {}
  :editorconfig/editorconfig-vim {}
  :haya14busa/incsearch.vim {:config (plugin.req :incsearch)}
  :itchyny/lightline.vim {:config (plugin.req :statusline)}
  :jiangmiao/auto-pairs {:config (plugin.req :auto-pairs)}
  :junegunn/fzf.vim {:requires :junegunn/fzf
                     :config (plugin.req :fzf)}
  :justinmk/vim-dirvish {:config (plugin.req :dirvish)}
  :mbbill/undotree {:config (plugin.req :undotree)}
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
