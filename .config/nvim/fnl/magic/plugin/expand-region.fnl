(module magic.plugin.expand-region
  {autoload {vimp vimp}})

(vimp.vmap :v "<Plug>(expand_region_expand)")
(vimp.vmap :<C-v> "<Plug>(expand_region_shrink)")
