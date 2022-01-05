(module magic.plugin.file-explorer
  {autoload {vimp vimp
             lir lir
             actions lir.actions
             float lir.float}})

; Disable netrw when invoked with $ nvim /path/to/directory
(set vim.g.loaded_netrw 1)
(set vim.g.loaded_netrwPlugin 1)

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



(vimp.nnoremap "<leader>," (fn [] (float.init (.. vim.env.XDG_CONFIG_HOME :/nvim/fnl/magic))))
(vimp.nnoremap :- float.init)
