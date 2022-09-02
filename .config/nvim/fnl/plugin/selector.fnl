(import-macros {: map! : command!} :hibiscus.vim)

(local fzf (require :fzf-lua))

(map! [n] :<leader>fa 'fzf.files)
(map! [n] :<leader>ff 'fzf.git_files)
(map! [n] :<leader>fg 'fzf.git_status)

(map! [n] :<leader>fb 'fzf.buffers)

(map! [n] :<leader>. '(fzf.git_files {:prompt "Dotfiles>"
                                      :git_dir (.. vim.env.HOME :/.dotfiles)
                                      :git_worktree vim.env.HOME}))
; TODO work in progress
; (vim.fn.cnoabbrev)
; (command! :Rg fzf)
