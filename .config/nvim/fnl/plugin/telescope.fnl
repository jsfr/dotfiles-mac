(import-macros {: map!} :hibiscus.vim)

(local actions (require :telescope.actions))
(local builtin (require :telescope.builtin))
(local trouble (require :trouble.providers.telescope))
(local telescope (require :telescope))

(telescope.setup {:defaults {:mappings {:i {:<c-t> trouble.open_with_trouble
                                            :<esc> actions.close}
                                        :n {:<c-t> trouble.open_with_trouble}}}
                  :extensions {:undo {:side_by_side true
                                      :layout_strategy :vertical
                                      :layout_config {:preview_height 0.8}}}})

;; Extensions
(telescope.load_extension :fzy_native)
(telescope.load_extension :undo)

(map! [n] :<leader>rg builtin.live_grep)
(map! [n] :<leader>fa #(builtin.find_files {:hidden true}))
(map! [n] :<leader>ft builtin.treesitter)
(map! [n] :<leader>fg builtin.git_status)
(map! [n] :<leader>ff builtin.git_files)
