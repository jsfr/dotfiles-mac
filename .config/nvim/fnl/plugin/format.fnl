(local conform (require :conform))

(conform.setup {:formatters_by_ft {:typescript [:prettier]
                                   :javascript [:prettier]
                                   :html [:prettier]
                                   :markdown [:prettier]
                                   :json [:prettier]
                                   :sh [:shfmt]}})

{}
