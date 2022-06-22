(module magic.plugin.selector
  {autoload {vimp vimp}})

(vimp.nnoremap [:silent] :<leader>fa ":Files<cr>")
(vimp.nnoremap [:silent] :<leader>ff ":GitFiles<cr>")
(vimp.nnoremap [:silent] :<leader>fg ":GitFiles?<cr>")
(vimp.nnoremap [:silent] :<leader>fb ":Buffers<cr>")
