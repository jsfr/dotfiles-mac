(module magic.defaults
  {autoload {nvim aniseed.nvim
             core aniseed.core}
   require-macros [magic.macros]})

(defn- set-options [...]
  (each [_ v (ipairs [...])]
    (let [[opt val] v
          (ok? val-or-err) (pcall core.assoc vim.o opt val)]
      (when (not ok?)
        (print (.. "Failed to set option '" opt "': " val-or-err))))))

(defn setup []
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
    [:foldmarker "#region,#endregion"]
    [:foldmethod :marker]
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
    [:relativenumber true]
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
    [:splitright true]
    [:tabstop 4]
    [:termguicolors true]
    [:textwidth 0]
    [:timeout false]
    [:timeoutlen 350]
    [:undodir "/tmp//,."]
    [:undofile true]
    [:undolevels 1000]
    [:undoreload 10000]
    [:updatetime 2000]
    [:wildmode "list:longest,full"]
    [:winminheight 0]
    [:wrap false]
    )
  (nvim.ex.autocmd :InsertEnter "*" "set timeout ttimeout")
  (nvim.ex.autocmd :InsertLeave "*" "set notimeout nottimeout"))
