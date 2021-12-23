(module magic.plugin.completion
  {autoload {cmp cmp
             nvim aniseed.nvim}})

(set vim.o.completeopt "menu,menuone,noselect")

(defn- snippet-fn [args]
  (vim.fn.call "vsnip#anonymous" [args.body]))

(defn- vsnip-available? []
  (= (vim.fn.call "vsnip#available" [1]) 1))

(defn- snip-jumpable? []
  (= (vim.fn.call "vsnip#jumpable" [-1]) 1))

(defn- feedkey [key mode]
  (nvim.feedkeys (nvim.replace_termcodes key true true true) mode true))

(defn- has-words-before? []
  (let [(line col) (unpack (nvim.win_get_cursor 0))
        line-range (. (nvim.buf_get_lines 0 (- line 1) line true) 1)]
    (and (~= col 0)
         (= (: (line-range:sub col col) :match :%s) nil))))

(defn- tab-complete [fallback]
  (if (cmp.visible)
    (cmp.select_next_item)
    (vsnip-available?)
    (feedkey "<Plug>(vsnip-expand-or-jump)" "")
    (has-words-before?)
    (cmp.complete)
    (fallback)))

(defn- s-tab-complete [fallback]
  (if (cmp.visible)
    (cmp.select_prev_item)
    (snip-jumpable?)
    (feedkey "<Plug>(vsnip-jump-prev)" "")
    (fallback)))

(cmp.setup {:snippet {:expand snippet-fn}
            :preselect false
            :mapping {:<C-b> (cmp.mapping (cmp.mapping.scroll_docs -4) [:i :c])
                      :<C-f> (cmp.mapping (cmp.mapping.scroll_docs 4) [:i :c])
                      :<Tab> (cmp.mapping tab-complete [:i :s])
                      :<S-Tab> (cmp.mapping s-tab-complete [:i :s])
                      :<CR> (cmp.mapping.confirm {:select false})}
            :sources [{:name :nvim_lsp}
                      {:name :vsnip}
                      {:name :buffer}
                      {:name :path}]})
