(import-macros {: set! : augroup! : setlocal!} :hibiscus.vim)

(fn set-options [...]
  (each [_ [opt val] (ipairs [...])]
    (set! opt val)))

(set-options
  [:autowrite true]
  [:background :dark]
  [:backup true]
  [:backupdir "/tmp//,."]
  [:breakindent true]
  [:clipboard "unnamedplus,unnamed"]
  [:cursorline true]
  [:directory "/tmp//,."]
  [:expandtab true]
  [:fileencoding "utf-8"]
  [:fileencodings "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"]
  [:fileformats "unix,dos,mac"]
  [:fillchars "stl: ,stlnc: ,fold: ,vert:│"]
  [:hidden true]
  [:ignorecase true]
  [:inccommand :split]
  [:joinspaces false]
  [:linespace 0]
  [:list true]
  [:listchars "tab:→ ,eol:↵,trail:·,extends:↷,precedes:↶"]
  [:magic true]
  [:matchtime 5]
  [:mouse :a]
  [:number true]
  [:pumheight 20]
  [:relativenumber (not vim.g.vscode)]
  [:report 0]
  [:ruler true]
  [:scrolljump 5]
  [:scrolloff 10]
  [:shell :/bin/bash]
  [:shiftwidth 4]
  [:shortmess :atOI]
  [:showbreak "↳\\_"]
  [:showcmd true]
  [:showmatch true]
  [:showmode false]
  [:smartcase true]
  [:softtabstop 4]
  [:spell false]
  [:splitbelow true]
  [:splitkeep :screen]
  [:splitright true]
  [:swapfile false]
  [:tabstop 4]
  [:termguicolors true]
  [:textwidth 0]
  [:timeout false]
  [:ttimeout false]
  [:timeoutlen 350]
  [:undodir "/tmp//,."]
  [:undofile true]
  [:undolevels 1000]
  [:undoreload 10000]
  [:updatetime 2000]
  [:wildmode "list:longest,full"]
  [:winminheight 0]
  [:wrap true])

(augroup! :timeout-group
          [[InsertEnter] "*" "set timeout ttimeout"]
          [[InsertLeave] "*" "set notimeout nottimeout"])

(fn markdown-group []
  ; (vim.cmd :PeekOpen)
  ; (vim.cmd :ZenMode)
  (setlocal! :linebreak true))

(augroup! :markdown-group [[FileType] [markdown] `markdown-group])

{}
