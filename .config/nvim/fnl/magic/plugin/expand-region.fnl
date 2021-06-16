(module magic.plugin.expand-region
  {autoload {m magic.mapping}})

(m.map :v :v "<plug>(expand_region_expand)" {})
(m.map :v :<C-v> "<plug>(expand_region_shrink)" {})
