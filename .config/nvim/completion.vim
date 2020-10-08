" Better display for messages
set cmdheight=1
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

let g:coc_global_extensions = [
      \ 'coc-vimlsp',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-stylelintplus',
      \ 'coc-rust-analyzer',
      \ 'coc-elixir',
      \ 'coc-prettier',
      \ 'coc-solargraph'
      \]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Set gorgeous colors for marked lines to sane, readable combinations 
" working with any colorscheme
au VimEnter,BufEnter,ColorScheme *
      \ exec "hi! CocInfoLine
      \ guifg=".(&background=='light'?'#808000':'#ffff00')."
      \ guibg=".(&background=='light'?'#ffff00':'#555500') |
      \ exec "hi! CocWarningLine
      \ guifg=".(&background=='light'?'#808000':'#ffff00')."
      \ guibg=".(&background=='light'?'#ffff00':'#555500') |
      \ exec "hi! CocErrorLine
      \ guifg=".(&background=='light'?'#ff0000':'#ff0000')."
      \ guibg=".(&background=='light'?'#ffcccc':'#550000')
