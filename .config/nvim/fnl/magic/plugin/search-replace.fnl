(module magic.plugin.file-explorer
  {autoload {spectre spectre
             vimp vimp}})

(spectre.setup)

(vimp.nnoremap :<leader>S "<cmd>lua require('spectre').open()<CR>")
(vimp.nnoremap :<leader>sw "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
(vimp.vnoremap :<leader>s "<esc>:lua require('spectre').open_visual()<CR>")
(vimp.nnoremap :<leader>sp ":lua require('spectre').open_file_search()<CR>")
