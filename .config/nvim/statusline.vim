let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \     'right': [ ['lineinfo'], ['cocstatus'], ['filetype'] ]
      \ },
      \ 'component_function': {
      \     'cocstatus': 'coc#status'
      \ }
\ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" " Disable showing mode in commandline
" set noshowmode
