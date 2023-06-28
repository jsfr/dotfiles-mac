(fn prepare-pkgs [input]
  (local pkgs [])
  (each [_ [name & opts] (ipairs input)]
    (local pkg {})
    (for [i 1 (- (length opts) 1) 2]
      (let [k (. opts i)
            v (. opts (+ i 1))]
        (tset pkg k v)))
    (tset pkg 1 name)
    (table.insert pkgs pkg))
  pkgs)

(fn lazy! [input cfg]
  (local pkgs (prepare-pkgs input))
  `((. (require :lazy) :setup) ,pkgs ,cfg))

{: lazy!}
