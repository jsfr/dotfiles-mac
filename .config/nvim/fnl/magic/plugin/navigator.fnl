(module magic.plugin.navigator
  {autoload {nav Navigator}})

(nav.setup {:auto_save "current"
            :disable_on_zoom true})

(let [map vim.api.nvim_set_keymap
      opts {:noremap true :silent true}]
  (map :n :<C-h> "<Cmd>lua require('Navigator').left()<cr>" opts)
  (map :n :<C-k> "<Cmd>lua require('Navigator').up()<cr>" opts)
  (map :n :<C-l> "<Cmd>lua require('Navigator').right()<cr>" opts)
  (map :n :<C-j> "<Cmd>lua require('Navigator').down()<cr>" opts)
  (map :n :<C-\> "<Cmd>lua require('Navigator').previous()<cr>" opts))
