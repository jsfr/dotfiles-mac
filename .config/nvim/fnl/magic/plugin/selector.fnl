(module magic.plugin.selector
  {autoload {vimp vimp}})

(defn- dotfiles []
  (vim.fn.call "fzf#run"
               [{:source "git --git-dir=/Users/jens/.dotfiles/ --work-tree=$HOME ls-files"
                 :sink :e}]))

(vimp.nnoremap [:silent] :<leader>fa ":Files<cr>")
(vimp.nnoremap [:silent] :<leader>ff ":GitFiles<cr>")
(vimp.nnoremap [:silent] :<leader>fg ":GitFiles?<cr>")
(vimp.nnoremap [:silent] :<leader>fb ":Buffers<cr>")
(vimp.nnoremap [:silent] :<leader>. dotfiles)
