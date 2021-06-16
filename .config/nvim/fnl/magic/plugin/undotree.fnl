(module magic.plugin.undotree
  {autoload {m magic.mapping}})

; Focus undotree when opening it
(set vim.g.undotree_SetFocusWhenToggle 1)

; Show undotree
(m.noremap :n :U ":UndotreeToggle<cr>")

