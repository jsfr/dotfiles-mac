(module magic.plugin.incsearch
  {autoload {m magic.mapping}})

(set vim.o.hlsearch true)
(set vim.g.incsearch#auto_nohlsearch 1)

(m.map "" :n  "<Plug>(incsearch-nohl-n)" {})
(m.map "" :N  "<Plug>(incsearch-nohl-N)" {})
(m.map "" :*  "<Plug>(incsearch-nohl-*)" {})
(m.map "" :#  "<Plug>(incsearch-nohl-#)" {})
(m.map "" :g* "<Plug>(incsearch-nohl-g*)" {})
(m.map "" :g# "<Plug>(incsearch-nohl-g#)" {})
(m.map "" :/  "<Plug>(incsearch-forward)" {})
(m.map "" :?  "<Plug>(incsearch-backward)" {})
(m.map "" :g/ "<Plug>(incsearch-stay)" {})
