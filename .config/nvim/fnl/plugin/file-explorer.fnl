(import-macros {: g! : map!} :hibiscus.vim)

(local lir (require :lir))
(local actions (require :lir.actions))
(local float (require :lir.float))

; Disable netrw when invoked with $ nvim /path/to/directory
(g! loaded_netrw 1)
(g! loaded_netrwPlugin 1)

(lir.setup {:show_hidden_files true
            :devicons_enable false
            :mappings {:<CR> actions.edit
                       :- actions.up
                       :<Esc> actions.quit
                       :q actions.quit
                       :K actions.mkdir
                       :D actions.delete
                       :N actions.newfile
                       :R actions.rename
                       :y actions.yank_path
                       :. actions.toggle_show_hidden}})

(map! [n] "<leader>," '(float.init (.. vim.env.XDG_CONFIG_HOME :/nvim)))
(map! [n] :- 'float.init)
