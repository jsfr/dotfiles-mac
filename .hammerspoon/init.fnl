(require :hs.ipc)

; (when (not (hs.ipc.cliStatus))
;   (hs.ipc.cliInstall :/opt/homebrew))

(global reload (require :auto-reload))
(reload.start)

(global keep_rmenu_focus (require :keep-rmenu-focus))
(keep_rmenu_focus.start)

(hs.loadSpoon :SpoonInstall)
(set spoon.SpoonInstall.repos.jsfr {:url "https://github.com/jsfr/Spoons"
                                    :desc "Personal Spoon repository of Jens Fredskov"
                                    :branch :main})
(spoon.SpoonInstall:andUse :PullRequests {:config {:username :jsfr
                                                   :keychainItem :github_api_token}
                                          :repo :jsfr
                                          :start true})
; (spoon.SpoonInstall:andUse :YabaiSpaces {:repo :jsfr})
