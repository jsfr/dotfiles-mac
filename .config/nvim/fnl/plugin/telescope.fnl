(import-macros {: map!} :hibiscus.vim)

(local actions (require :telescope.actions))
(local builtin (require :telescope.builtin))
(local trouble (require :trouble.providers.telescope))
(local telescope (require :telescope))

(telescope.setup {:defaults {:mappings {:i {:<c-t> trouble.open_with_trouble
                                            :<esc> actions.close}
                                        :n {:<c-t> trouble.open_with_trouble}}}})

(map! [n] :<leader>f/ builtin.live_grep)
(map! [n] :<leader>ff #(builtin.find_files {:hidden true}))
(map! [n] :<leader>ft builtin.treesitter)
(map! [n] :<leader>f? builtin.git_status)
(map! [n] :<leader>fg builtin.git_files)
