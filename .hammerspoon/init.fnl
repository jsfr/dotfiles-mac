(require :hs.ipc)

(when (not (hs.ipc.cliStatus))
  (hs.ipc.cliInstall))

(set hs.logger.defaultLogLevel :info)

(global reload (require :auto-reload))
(reload.start)

(global spaces (require :spaces))

(global no_music (require :no-music))
(no_music.start)

(global keep_rmenu_focus (require :keep-rmenu-focus))
(keep_rmenu_focus.start)

(global pull_requests (require :pull-requests))
(global pull_requests_timer (hs.timer.new 60 pull_requests.update))
(pull_requests_timer:start)

(global keychain (require :keychain))
