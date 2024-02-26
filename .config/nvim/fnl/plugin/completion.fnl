(local cmp (require :cmp))
(local compare (require :cmp.config.compare))
(local lspkind (require :lspkind))

(set vim.o.completeopt "menu,menuone,noselect")

(fn snippet-fn [args]
  (vim.fn.call "vsnip#anonymous" [args.body]))

(fn vsnip-available? []
  (= (vim.fn.call "vsnip#available" [1]) 1))

(fn snip-jumpable? []
  (= (vim.fn.call "vsnip#jumpable" [-1]) 1))

(fn feedkey [key mode]
  (vim.api.nvim_feedkeys (vim.api.nvim_replace_termcodes key true true true) mode true))

(fn has-words-before? []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))
        line-range (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1)]
    (and (~= col 0)
         (= (: (line-range:sub col col) :match :%s) nil))))

(fn tab-complete [fallback]
  (if (cmp.visible)
    (cmp.select_next_item)
    (vsnip-available?)
    (feedkey "<Plug>(vsnip-expand-or-jump)" "")
    (has-words-before?)
    (cmp.complete)
    (fallback)))

(fn s-tab-complete [fallback]
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
            :sources [{:name :nvim_lsp :max_item_count 30}
                      {:name :conjure}
                      {:name :vsnip}
                      {:name :path}
                      {:name :buffer :keyword_length 3}]
            :formatting {:format (lspkind.cmp_format)}
            :sorting {:comparators [compare.locality
                                    compare.recently_used
                                    compare.score
                                    compare.offset
                                    compare.order]}})

(cmp.setup.cmdline ":" {:mapping (cmp.mapping.preset.cmdline)
                        :sources (cmp.config.sources [{:name :path}
                                                      {:name :cmdline
                                                       :option {:ignore_cmds [:Man :!]}}])
                        :view {:entries {:name :wildmenu
                                         :separator " · "}}})

(cmp.setup.cmdline :/ {:mapping (cmp.mapping.preset.cmdline)
                       :sources [{:name :buffer}]})

{}
