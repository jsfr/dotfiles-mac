(module magic.mappings
  {autoload {vimp vimp
             nvim aniseed.nvim}})

(defn setup []
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
  (vimp.nnoremap :<leader>d "<Cmd>lua MiniBufremove.delete(0, false)<cr>")

  ;; Indent entire buffer
  (vimp.nnoremap :<leader>= "mzgg=G`z")


  ;; Visual shifting (does not exit Visual mode)
  (vimp.vnoremap :< :<gv)
  (vimp.vnoremap :> :>gv)

  ;; Treat long lines as break lines (useful when moving around in them)
  (vimp.nmap :j :gj)
  (vimp.nmap :k :gk)
  (vimp.vmap :j :gj)
  (vimp.vmap :k :gk)

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
  )
