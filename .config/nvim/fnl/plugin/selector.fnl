(import-macros {: map!} :hibiscus.vim)

(local fzf (require :fzf-lua))

(fn dotfiles []
  (vim.fn.call "fzf#run" [{:source "git --git-dir=$HOME/.dotfiles/ ls-files" :sink "function()"}]))

(map! [n] :<leader>fa 'fzf.files)
(map! [n] :<leader>ff 'fzf.git_files)
(map! [n] :<leader>fg 'fzf.git_status)

(map! [n] :<leader>fb 'fzf.buffers)

(map! [n] :<leader>. '(fzf.git_files {:prompt "Dotfiles>"
                                      :git_dir "~/.dotfiles/"
                                      :git_worktree "~/"}))
