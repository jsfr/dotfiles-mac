(import-macros {: g! : map!} :hibiscus.vim)

; Focus undotree when opening it
(g! undotree_SetFocusWhenToggle 1)

; Show undotree
(map! [n] :U :<Cmd>UndotreeToggle<cr>)
