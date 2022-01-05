(module magic.plugin.tmux
  {autoload {nav Navigator
             vimp vimp}})

(nav.setup {:auto_save "current"
            :disable_on_zoom true})

(vimp.nnoremap [:silent :override] :<C-h> "<Cmd>lua require('Navigator').left()<cr>")
(vimp.nnoremap [:silent :override] :<C-k> "<Cmd>lua require('Navigator').up()<cr>")
(vimp.nnoremap [:silent :override] :<C-l> "<Cmd>lua require('Navigator').right()<cr>")
(vimp.nnoremap [:silent :override] :<C-j> "<Cmd>lua require('Navigator').down()<cr>")
(vimp.nnoremap [:silent :override] :<C-\> "<Cmd>lua require('Navigator').previous()<cr>")
