(module magic.plugin.mini
  {autoload {vimp vimp
             nvim aniseed.nvim
             mcomment mini.comment
             mjump mini.jump
             mpairs mini.pairs
             mbufremove mini.bufremove}
   require-macros [magic.macros]})

(mcomment.setup {:mappings {:comment :gc
                           :comment_line :gcc
                           :textobject :gc}})
(augroup mini-comment
         (nvim.ex.autocmd :Filetype "just" "setlocal commentstring=#\\ %s"))

(mjump.setup {:mappings {:forward :f
                        :backward :F
                        :forward_till :t
                        :backward_till :T
                        :repeat_jump ""}
             :highlight_delay 250})

(mpairs.setup {})

(mbufremove.setup {})
