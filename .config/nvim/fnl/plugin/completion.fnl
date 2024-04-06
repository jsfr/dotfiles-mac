(local cmp (require :cmp))
(local compare (require :cmp.config.compare))
(local lspkind (require :lspkind))
(local luasnip (require :luasnip))

(set vim.o.completeopt "menu,menuone,noselect")

(fn snippet-fn [args]
  (luasnip.lsp_expand args.body))

(fn tab-complete [fallback]
  (if
    (cmp.visible)
      (cmp.select_next_item)
    (luasnip.expand_or_jumpable)
      (luasnip.expand_or_jump)
    ; (has-words-before?)
    ;   (cmp.complete)
    (fallback)))

(fn s-tab-complete [fallback]
  (if
    (cmp.visible)
      (cmp.select_prev_item)
    (luasnip.jumpable -1)
      (luasnip.jump -1)
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
                      {:name :luasnip :option {:use_show_condition false}}
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
