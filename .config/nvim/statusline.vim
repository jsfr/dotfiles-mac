let g:lightline = {}

" colorscheme
" let g:lightline.colorscheme = 'oceanicnext'
let g:lightline.colorscheme = 'seoul256'

" functions
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" lightline setup
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \  'linter_checking': 'left',
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'left',
      \ }
let g:lightline.component_function = {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ }

let g:lightline.active = {
      \  'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \  'right': [ 
      \    [ 'lineinfo' ],
      \    [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \    [ 'cocstatus' ],
      \    [ 'filetype' ]
      \  ]
      \ }

" Disable showing mode in commandline
set noshowmode
