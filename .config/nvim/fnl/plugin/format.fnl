(local conform (require :conform))

(conform.setup {:formatters_by_ft {:typescript [:prettier]
                                   :html [:prettier]
                                   :markdown [:prettier]}})

{}
