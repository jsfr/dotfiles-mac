(import-macros {: map!} :hibiscus.vim)

(local gitsigns (require :gitsigns))

(gitsigns.setup {:worktrees [{:toplevel vim.env.HOME :gitdir (.. vim.env.HOME :/.dotfiles)}]})

(map! [n] "]c" gitsigns.next_hunk)
(map! [n] "[c" gitsigns.prev_hunk)

(vim.cmd "cnoreabbrev <expr> gs (getcmdtype() == ':') ? 'Gitsigns' : 'gs'")

{}
