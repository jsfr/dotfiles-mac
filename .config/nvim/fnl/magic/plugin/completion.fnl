(module magic.plugin.completion
  {autoload {c compe
             vimp vimp
             npairs nvim-autopairs}})

(set vim.o.completeopt "menuone,noselect")

(c.setup {:enabled true
          :autocomplete true
          :debug false
          :min_length 1
          :preselect :enable
          :throttle_time 80
          :source_timeout 200
          :incomplete_delay 400
          :max_abbr_width 100
          :max_kind_width 100
          :max_menu_width 100
          :documentation true
          :source {:path true
                   :buffer true
                   :calc true
                   :nvim_lsp true
                   :nvim_lua true
                   :vsnip true
                   :conjure true}})

(defn- t [str]
  (vim.api.nvim_replace_termcodes str true true true))

(defn- back-space? []
  (let [col (- (vim.fn.col ".") 1)
        line (vim.fn.getline ".")
        zero? (= col 0)
        match? (: (: line :sub col col) :match :%s)]
    (if (or zero? match?)
      true
      false)))

(defn- pum-visible? []
  (= (vim.fn.pumvisible) 1))

(defn- snip-available? []
  (= (vim.fn.call "vsnip#available" [1]) 1))

(defn- snip-jumpable? []
  (= (vim.fn.call "vsnip#jumpable" [-1]) 1))

(defn- complete-info-selected? []
  (~= (. (vim.fn.complete_info) :selected) -1))

(defn- tab-complete []
  (if (pum-visible?)
    (t :<C-n>)
    (snip-available?)
    (t "<Plug>(vsnip-expand-or-jump)")
    (back-space?)
    (t :<Tab>)
    ((. vim.fn :compe#complete))))

(defn- s-tab-complete []
  (if (pum-visible?)
    (t :<C-p>)
    (snip-jumpable?)
    (t "<Plug>(vsnip-jump-prev)")
    (t :<S-Tab>)))

(defn- completion-confirm-key []
  (let [esc (npairs.esc :<cr>)
        confirm (. vim.fn :compe#confirm)] 
    (if (pum-visible?)
      (if (complete-info-selected?)
        (confirm esc)
        esc)
      (npairs.autopairs_cr))))

(tset _G :tab_complete tab-complete)
(tset _G :s_tab_complete s-tab-complete)
(tset _G :completion_confirm_key completion-confirm-key)

(vim.api.nvim_set_keymap :i :<Tab>   (.. "v:lua.tab_complete()")           {:expr true})
(vim.api.nvim_set_keymap :s :<Tab>   (.. "v:lua.tab_complete()")           {:expr true})
(vim.api.nvim_set_keymap :i :<S-Tab> (.. "v:lua.s_tab_complete()")         {:expr true})
(vim.api.nvim_set_keymap :s :<S-Tab> (.. "v:lua.s_tab_complete()")         {:expr true})
(vim.api.nvim_set_keymap :i :<CR>    (.. "v:lua.completion_confirm_key()") {:expr true :silent true})
