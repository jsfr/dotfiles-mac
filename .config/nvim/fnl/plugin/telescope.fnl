(import-macros {: map!} :hibiscus.vim)

(local actions (require :telescope.actions))
(local builtin (require :telescope.builtin))
(local trouble (require :trouble.sources.telescope))
(local file-history (require :file_history))
(local telescope (require :telescope))

(telescope.setup {:defaults {:mappings {:i {:<c-t> trouble.open
                                            :<esc> actions.close}
                                        :n {:<c-t> trouble.open}}}
                  :extensions {:undo {:side_by_side true
                                      :layout_strategy :vertical
                                      :layout_config {:preview_height 0.8}}}})

(file-history.setup {})

;; Extensions
(telescope.load_extension :fzy_native)
(telescope.load_extension :undo)
(telescope.load_extension :file_history)

(map! [n] :<leader>rg builtin.live_grep)
(map! [n] :<leader>fa #(builtin.find_files {:hidden true}))
(map! [n] :<leader>ft builtin.treesitter)
(map! [n] :<leader>fg builtin.git_status)
(map! [n] :<leader>ff builtin.git_files)
(map! [n] :<leader>fb builtin.buffers)
(map! [n] :<leader>fr builtin.registers)
(map! [n] :<leader>. #(builtin.git_files {:cwd "$DOFI_DIR"
                                          :show_untracked true}))
