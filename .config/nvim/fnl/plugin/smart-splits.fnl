(import-macros {: map!} :hibiscus.vim)

(local ss (require :smart-splits))

;; resizing splits
(map! [n] :<A-h> ss.resize_left)
(map! [n] :<A-j> ss.resize_down)
(map! [n] :<A-k> ss.resize_up)
(map! [n] :<A-l> ss.resize_right)

;; moving between splits
(map! [n] :<C-h> ss.move_cursor_left)
(map! [n] :<C-j> ss.move_cursor_down)
(map! [n] :<C-k> ss.move_cursor_up)
(map! [n] :<C-l> ss.move_cursor_right)

;; swapping buffers between windows
(map! [n] :<leader><leader>h ss.swap_buf_left)
(map! [n] :<leader><leader>j ss.swap_buf_down)
(map! [n] :<leader><leader>k ss.swap_buf_up)
(map! [n] :<leader><leader>l ss.swap_buf_right)

(ss.setup {:ignored_buftypes {:NvimTree
                              :undotree}})

{}
