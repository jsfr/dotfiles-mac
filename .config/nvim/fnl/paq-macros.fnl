(fn paq! [input]
 (fn split-pkgs-and-configs [input]
  (local configs [])
  (local pkgs {})
  (each [_ [name & opts] (ipairs input)]
   (local pkg {})
   (for [i 1 (- (length opts) 1) 2]
    (let [k (. opts i)
          v (. opts (+ i 1))]
     (match k
      :config (table.insert configs v)
      :requires (each [_ rname (ipairs v)]
                 (tset pkgs rname {}))
      _ (tset pkg k v))))
   (tset pkgs name pkg))
  (local cpkgs [])
  (each [name pkg (pairs pkgs)]
   (tset pkg 1 name)
   (table.insert cpkgs pkg))
  [cpkgs configs])
 (local [pkgs configs] (split-pkgs-and-configs input))
 (local output [])
 (table.insert output `((require :paq) ,pkgs))
 (each [_ config (ipairs configs)]
                 (table.insert output `(,config)))
 output
 )

{: paq!}
