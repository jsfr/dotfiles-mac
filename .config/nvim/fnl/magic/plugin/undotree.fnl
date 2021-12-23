(module magic.plugin.undotree
  {autoload {vimp vimp}})

; Focus undotree when opening it
(set vim.g.undotree_SetFocusWhenToggle 1)

; Show undotree
(vimp.nnoremap [:override] :U :<Cmd>UndotreeToggle<cr>)

