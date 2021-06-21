(module magic.plugin.incsearch
  {autoload {vimp vimp}})

(set vim.o.hlsearch true)
(set vim.g.incsearch#auto_nohlsearch 1)

(vimp.rbind :nvo :n  "<Plug>(incsearch-nohl-n)")
(vimp.rbind :nvo :N  "<Plug>(incsearch-nohl-N)")
(vimp.rbind :nvo :*  "<Plug>(incsearch-nohl-*)")
(vimp.rbind :nvo :#  "<Plug>(incsearch-nohl-#)")
(vimp.rbind :nvo :g* "<Plug>(incsearch-nohl-g*)")
(vimp.rbind :nvo :g# "<Plug>(incsearch-nohl-g#)")
(vimp.rbind :nvo :/  "<Plug>(incsearch-forward)")
(vimp.rbind :nvo :?  "<Plug>(incsearch-backward)")
(vimp.rbind :nvo :g/ "<Plug>(incsearch-stay)")
