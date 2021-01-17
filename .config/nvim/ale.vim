let g:ale_linters                 = {}
let g:ale_linters.go              = ['gometalinter']
let g:ale_linters.rust            = []
let g:ale_linters.python          = ['flake8']
let g:ale_linters.javascript      = []
let g:ale_linters.javascriptreact = []
let g:ale_linters.typescript      = []
let g:ale_linters.typescriptreact = []
let g:ale_linters.markdown        = []
let g:ale_linters.elixir          = []

let g:ale_fixers                  = {}
let g:ale_fixers.sh               = ['shfmt']
let g:ale_fixers.python           = ['black']

let g:ale_fix_on_save             = 1

" Keybindings
nmap [l <Plug>(ale_previous_wrap_error)
nmap ]l <Plug>(ale_next_wrap_error)
nmap [L <Plug>(ale_first)
nmap ]L <Plug>(ale_last)
