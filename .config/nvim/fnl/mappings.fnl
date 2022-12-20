(import-macros {: g! : map!} :hibiscus.vim)

(g! mapleader " ")
(g! maplocalleader ",")

;; jj escape sequence
(map! [i] :jj :<esc>)
(map! [c] :jj :<c-c>)

;; Spacemacs inspired keybings
(map! [n] :<leader>wc :<C-w>q)
(map! [n] :<leader>w/ :<Cmd>vsplit<cr>)
(map! [n] :<leader>w- :<Cmd>split<cr>)
(map! [n] :<leader>w_ :<C-W>_)

(map! [i] :<Tab> :<C-t>)
(map! [i] :<S-Tab> :<C-d>)

;; Indent entire buffer
(map! [n] :<leader>= "mzgg=G`z")

;; Visual shifting (does not exit Visual mode)
(map! [v] :< :<gv)
(map! [v] :> :>gv)

;; Treat long lines as break lines (useful when moving around in them)
(map! [nv] :j :gj)
(map! [nv] :k :gk)

;; Tab to go to last active buffer
(fn mru-buffer []
  (-> :#
      (vim.fn.bufnr)
      (vim.fn.buflisted)
      (= 1)
      (if
        (vim.cmd "b #")
        (vim.cmd "bprev"))))
(map! [n] :<tab> 'mru-buffer)
