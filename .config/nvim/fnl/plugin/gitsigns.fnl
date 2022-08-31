(import-macros {: map!} :hibiscus.vim)

(local gitsigns (require :gitsigns))

(gitsigns.setup)

(map! [n] "]c" 'gitsigns.next_hunk)
(map! [n] "[c" 'gitsigns.prev_hunk)
