(module magic.plugin.mini
  {autoload {vimp vimp
             nvim aniseed.nvim
             mini-comment mini.comment
             mini-jump mini.jump
             mini-pairs mini.pairs
             mini-bufremove mini.bufremove
             mini-starter mini.starter
             mini-surround mini.surround}
   require-macros [magic.macros]})

(mini-comment.setup {:mappings {:comment :gc
                           :comment_line :gcc
                           :textobject :gc}})
(augroup mini-comment
         (nvim.ex.autocmd :Filetype "just" "setlocal commentstring=#\\ %s"))

(mini-jump.setup {:mappings {:forward :f
                        :backward :F
                        :forward_till :t
                        :backward_till :T
                        :repeat_jump ""}
             :highlight_delay 250})

(mini-pairs.setup {})

(mini-bufremove.setup {})

(mini-starter.setup {})

(mini-surround.setup {:mappings {:add :S
                                 :delete :ds
                                 :find ""
                                 :find_left ""
                                 :highlight ""
                                 :replace :cs
                                 :update_n_lines ""}})
