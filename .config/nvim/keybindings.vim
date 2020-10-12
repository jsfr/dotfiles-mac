" Go to mru buffer
function! MRUBuffer()
  if buflisted(bufnr("#"))
    execute "b #"
  else
    execute "bprev"
  endif
endfunction
nnoremap <tab> :call MRUBuffer()<CR>

" Spacemacs inspired keybings
nnoremap <leader>w= <C-W>=
nnoremap <leader>wq <C-w>q
nnoremap <leader>wc <C-w>q
nnoremap <leader>wd <C-w>q
nnoremap <leader>w/ :vsplit<CR>
nnoremap <leader>w- :split<CR>
nnoremap <leader>w\| <C-W>\|
nnoremap <leader>w_ <C-W>_
nnoremap <leader>f :Files<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>g :GFiles?<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>, :Dirvish $MYVIMRC<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>n :noh<CR>

" Use ; for commands.
nnoremap ; :
vnoremap ; :

" Indent entire buffer
map <leader>= mzgg=G`z

" See http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" search for current highlight
vnoremap \ yq/p<CR>N

" make it easier to search with rg
cnoreabbrev rg Rg

" make it easier to save with git
cnoreabbrev gw Gw

" incsearch setup
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" gitgutter setup
let g:gitgutter_map_keys = 0
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" Clever-f setup
let g:clever_f_fix_key_direction = 1

" Ale general
nmap [l <Plug>(ale_previous_wrap_error)
nmap ]l <Plug>(ale_next_wrap_error)
nmap [L <Plug>(ale_first)
nmap ]L <Plug>(ale_last)

" Coc
" Typescript, Javascript, JSX, TSX
au FileType typescriptreact,typescript,javascript,javascriptreact,rust nmap [l <Plug>(coc-diagnostic-prev-error)
au FileType typescriptreact,typescript,javascript,javascriptreact,rust nmap ]l <Plug>(coc-diagnostic-next-error)
au FileType typescriptreact,typescript,javascript,javascriptreact,rust nmap [L :lfirst<cr>
au FileType typescriptreact,typescript,javascript,javascriptreact,rust nmap ]L :llast<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>cr :CocRestart<CR>

command! Dotfiles
  \ call fzf#run(fzf#wrap({
  \     'source': 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files',
  \     'sink': 'e',
  \     'dir': '$HOME'
  \ }))

nmap <leader>. :Dotfiles<CR>
