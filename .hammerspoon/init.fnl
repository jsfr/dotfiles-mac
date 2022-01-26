(require :hs.ipc)

(when (not (hs.ipc.cliStatus))
  (hs.ipc.cliInstall))

(global reload (require :auto-reload))
(reload.start)

(global spaces (require :spaces))

(global pull_requests (require :pull-requests))

(global no_music (require :no-music))
(no_music.start)

(global keep_rmenu_focus (require :keep-rmenu-focus))
(keep_rmenu_focus.start)
