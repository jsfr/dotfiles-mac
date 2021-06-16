(module magic.plugin.dirvish
  {})

; Allow netrw to remove non-empty local directories
(set vim.g.netrw_localrmdir "trash")
(set vim.g.netrw_altfile 1)

; Sort folders before files
(set vim.g.dirvish_mode ":sort ,^.*[/],")
