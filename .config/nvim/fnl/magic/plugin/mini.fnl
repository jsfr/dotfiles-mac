(module magic.plugin.mini
  {autoload {mcomment mini.comment
             mjump mini.jump
             mpairs mini.pairs}})


(mcomment.setup {:mappings {:comment :gc
                           :comment_line :gcc
                           :textobject :gc}})

(mjump.setup {:mappings {:forward :f
                        :backward :F
                        :forward_till :t
                        :backward_till :T
                        :repeat_jump ""}
             :highlight_delay 250})

(mpairs.setup {})
