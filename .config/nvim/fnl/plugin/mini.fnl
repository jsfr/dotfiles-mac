(import-macros {: augroup! : map!} :hibiscus.vim)

(local mini-comment (require :mini.comment))
(mini-comment.setup {:mappings {:comment :gc
                                :comment_line :gcc
                                :textobject :gc}})
(augroup! :mini-comment
          [[Filetype] [:just :fish] "setlocal commentstring=#\\ %s"])


(local mini-jump (require :mini.jump))
(mini-jump.setup {:mappings {:forward :f
                             :backward :F
                             :forward_till :t
                             :backward_till :T
                             :repeat_jump ""}
                  :delay {:highlight 250}})

(local mini-pairs (require :mini.pairs))
(mini-pairs.setup {})
(augroup! :mini-pairs-rust
          [[Filetype] [:rust] #(do
                                 (mini-pairs.map_buf 0 :i :< {:action :open :pair :<> :neigh_pattern "[:]." :register {:cr false}})
                                 (mini-pairs.map_buf 0 :i :> {:action :close :pair :<> :register {:cr false}}))])

(when (not vim.g.vscode)
  (local mini-bufremove (require :mini.bufremove))
  (mini-bufremove.setup {})
  ;; Delete current buffer, keeping layout unless the buffer was a help buffer
  (fn delete-buffer []
    (let [buftype (vim.api.nvim_buf_get_option 0 :buftype)
                  bufcount (length (vim.api.nvim_list_bufs))]
      (if (or (<= bufcount 2) (vim.tbl_contains [:help :quickfix] buftype))
          (vim.api.nvim_buf_delete 0 {})
          (mini-bufremove.delete 0 false))))
  (map! [n] :<leader>d delete-buffer)
  (map! [n] :<leader>x (fn [] (vim.api.nvim_buf_delete 0 {})))

  (local mini-starter (require :mini.starter))
  (mini-starter.setup {:query_updaters "abcdefghijklmnopqrstuvwxyz0123456789_."})

  (local mini-bracketed (require :mini.bracketed))
  (mini-bracketed.setup))

(local mini-surround (require :mini.surround))
(mini-surround.setup {:mappings {:add :S
                                 :delete :ds
                                 :find ""
                                 :find_left ""
                                 :highlight ""
                                 :replace :cs
                                 :update_n_lines ""}})

(local mini-align (require :mini.align))
(mini-align.setup)

{}
