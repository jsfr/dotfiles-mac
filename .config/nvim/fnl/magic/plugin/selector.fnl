(module magic.plugin.selector
  {autoload {vimp vimp}})

(vimp.nnoremap [:silent] :<leader>ff ":GitFiles<cr>")
(vimp.nnoremap [:silent] :<leader>fg ":GitFiles?" (fn [] (fzy.execute "git ls-files" fzy.sinks.edit_file)))
(vimp.nnoremap [:silent] :<leader>fb ":Buffers<cr>")
(vimp.nnoremap [:silent] :<leader>fl ":Lines<cr>")
(vimp.nnoremap [:silent] :<leader>f/ ":Blines<cr>")
(vimp.nnoremap [:silent] :<leader>fm ":Marks<cr>")
