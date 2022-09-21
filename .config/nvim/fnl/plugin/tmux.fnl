(import-macros {: map!} :hibiscus.vim)

(local nav (require :Navigator))

(nav.setup {:auto_save "current"
            :disable_on_zoom true})

(map! [n] :<C-h> 'nav.left)
(map! [n] :<C-k> 'nav.up)
(map! [n] :<C-l> 'nav.right)
(map! [n] :<C-j> 'nav.down)
(map! [n] :<C-Tab> 'nav.previous)

{}
