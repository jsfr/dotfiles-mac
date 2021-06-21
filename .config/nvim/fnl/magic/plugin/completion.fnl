(module magic.plugin.completion
  {autoload {c compe
             vimp vimp}})

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

(defn- tab-complete []
  (if (= (vim.fn.pumvisible) 1)
    (t :<C-n>)
    (back-space?)
    (t :<Tab>)
    ((. vim.fn :compe#complete))))

(defn- s-tab-complete []
  (if (= (vim.fn.pumvisible) 1)
    (t :<C-p>)
    ; If <S-Tab> is not working in your terminal, change it to <C-h>
    (t :<S-Tab>)))

(tset _G :tab_complete tab-complete)
(tset _G :s_tab_complete s-tab-complete)

(vim.api.nvim_set_keymap :i :<Tab>   (.. "v:lua.tab_complete()") {:expr true})
(vim.api.nvim_set_keymap :s :<Tab>   (.. "v:lua.tab_complete()") {:expr true})
(vim.api.nvim_set_keymap :i :<S-Tab> (.. "v:lua.s_tab_complete()") {:expr true})
(vim.api.nvim_set_keymap :s :<S-Tab> (.. "v:lua.s_tab_complete()") {:expr true})
