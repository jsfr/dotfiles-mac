(import-macros {: map!} :hibiscus.vim)

(local spectre (require :spectre))

(spectre.setup)

(map! [n] :<leader>S spectre.open)
(map! [n] :<leader>sw #(spectre.open_visual {:select_word true}))
(map! [n] :<leader>s spectre.open_visual)
(map! [n] :<leader>sp spectre.open_file_search)

{}
