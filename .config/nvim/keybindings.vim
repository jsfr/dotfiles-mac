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

" vim-peculiar
nmap <leader>nv <Plug>PeculiarV
nmap <leader>ng <Plug>PeculiarG
nmap <leader>nn <Plug>PeculiarN
nmap <leader>nr <Plug>PeculiarR

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

" vim-slash setup
noremap <plug>(slash-after) zz

" gitgutter setup
let g:gitgutter_map_keys = 0
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" Clever-f setup
let g:clever_f_fix_key_direction = 1

command! Dotfiles
  \ call fzf#run(fzf#wrap({
  \     'source': 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files',
  \     'sink': 'e',
  \     'dir': '$HOME'
  \ }))

nmap <leader>. :Dotfiles<CR>

" Use jj to exit modes
ino jj <esc>
cno jj <c-c>
