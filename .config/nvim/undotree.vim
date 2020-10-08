" Add persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Show undotree
nnoremap U :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
