(module magic.mappings
  {autoload {vimp vimp
             nvim aniseed.nvim}})

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
(vimp.nnoremap :<leader>wc :<C-w>q)
(vimp.nnoremap :<leader>w/ :<Cmd>vsplit<cr>)
(vimp.nnoremap :<leader>w- :<Cmd>split<cr>)
(vimp.nnoremap :<leader>w\| :<C-W>\|)
(vimp.nnoremap :<leader>w_ :<C-W>_)
(vimp.nnoremap "<leader>," "<Cmd>Dirvish $MYVIMRC<cr>")
(vimp.nnoremap :<leader>d "<Cmd>lua MiniBufremove.delete(0, false)<cr>")

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

