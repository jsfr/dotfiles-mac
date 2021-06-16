(module magic.plugin.statusline
  {})

(set vim.o.showmode false)

; TODO finish this
; (set vim.g.lightline)
; let g:lightline = {
;       \ 'colorscheme': 'seoul256',
;       \ 'active': {
;       \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
;       \     'right': [ ['lineinfo'], ['cocstatus'], ['filetype'] ]
;       \ },
;       \ 'component_function': {
;       \     'cocstatus': 'coc#status'
;       \ }
; \ }

; " Use autocmd to force lightline update.
; autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
