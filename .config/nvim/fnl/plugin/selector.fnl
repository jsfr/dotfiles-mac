(import-macros {: map!} :hibiscus.vim)

(fn dotfiles []
  (vim.fn.call "fzf#run"
               [{:source "git --git-dir=/Users/jens/.dotfiles/ --work-tree=$HOME ls-files"
                 :sink :e}]))

(map! [n] :<leader>fa ":Files<cr>")
(map! [n] :<leader>ff ":GitFiles<cr>")
(map! [n] :<leader>fg ":GitFiles?<cr>")
(map! [n] :<leader>fb ":Buffers<cr>")
(map! [n] :<leader>. dotfiles)
