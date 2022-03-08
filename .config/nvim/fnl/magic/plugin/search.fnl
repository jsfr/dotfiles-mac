(module magic.plugin.search
  {autoload {vimp vimp
             util aniseed.nvim.util
             hlslens hlslens}})

; (set vim.o.hlsearch true)
; (set vim.g.incsearch#auto_nohlsearch 1)
;
; (vimp.rbind :nvo :n  "<Plug>(incsearch-nohl-n)")
; (vimp.rbind :nvo :N  "<Plug>(incsearch-nohl-N)")
; (vimp.rbind :nvo :*  "<Plug>(incsearch-nohl-*)")
; (vimp.rbind :nvo :#  "<Plug>(incsearch-nohl-#)")
; (vimp.rbind :nvo :g* "<Plug>(incsearch-nohl-g*)")
; (vimp.rbind :nvo :g# "<Plug>(incsearch-nohl-g#)")
; (vimp.rbind :nvo :/  "<Plug>(incsearch-forward)")
; (vimp.rbind :nvo :?  "<Plug>(incsearch-backward)")
; (vimp.rbind :nvo :g/ "<Plug>(incsearch-stay)")

; noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
;             \<Cmd>lua require('hlslens').start()<CR>
; noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
;             \<Cmd>lua require('hlslens').start()<CR>
; noremap * *<Cmd>lua require('hlslens').start()<CR>
; noremap # #<Cmd>lua require('hlslens').start()<CR>
; noremap g* g*<Cmd>lua require('hlslens').start()<CR>
; noremap g# g#<Cmd>lua require('hlslens').start()<CR>
;
; (vimp.noremap [:silent] :n (fn [] ))
;                                     (normal))))

(hlslens.setup {:calm_down true
                :nearest_only true})
