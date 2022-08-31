(import-macros {: augroup! : map!} :hibiscus.vim)

(local mini-comment (require :mini.comment))
(local mini-jump (require :mini.jump))
(local mini-pairs (require :mini.pairs))
(local mini-bufremove (require :mini.bufremove))
(local mini-starter (require :mini.starter))
(local mini-surround (require :mini.surround))

(mini-comment.setup {:mappings {:comment :gc
                                :comment_line :gcc
                                :textobject :gc}})
(augroup! :mini-comment
          [[Filetype] :just "setlocal commentstring=#\\ %s"])

(mini-jump.setup {:mappings {:forward :f
                             :backward :F
                             :forward_till :t
                             :backward_till :T
                             :repeat_jump ""}
                  :delay {:highlight 250}})

(mini-pairs.setup {})

(mini-bufremove.setup {})

;; Delete current buffer, keeping layout unless the buffer was a help buffer
(fn delete-buffer [close-window?]
  (let [buftype (vim.api.nvim_buf_get_option 0 :buftype)]
    (if (or close-window? (vim.tbl_contains [:help :quickfix] buftype))
      (vim.api.nvim_buf_delete 0 {})
      (mini-bufremove.delete 0 false))))
(map! [n] :<leader>d '(delete-buffer false))
(map! [n] :<leader>x '(delete-buffer true))

(mini-starter.setup {})

(mini-surround.setup {:mappings {:add :S
                                 :delete :ds
                                 :find ""
                                 :find_left ""
                                 :highlight ""
                                 :replace :cs
                                 :update_n_lines ""}})
